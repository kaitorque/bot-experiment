if 
	GetBot():IsIllusion() 
	or GetBot():IsInvulnerable()
	or not (GetBot():IsHero() or string.find(GetBot():GetUnitName(), "npc_dota_lone_druid_bear"))
then
	return;
end

local utils = require(GetScriptDirectory() ..  "/util")
local mutil = require(GetScriptDirectory() .. "/MyUtility")
local wardUtils = require(GetScriptDirectory() ..  "/WardUtility")
local role = require(GetScriptDirectory() .. "/RoleUtility");



local bot = GetBot();
local AvailableSpots = {};
local nWardCastRange = 500;
local wt = nil;
local itemWard = nil;
local targetLoc = nil;
local smoke = nil;
local wardCastTime = -90;
local swapTime = -90;
local enemyPids = nil;
local modeEntryTime = -1000;

bot.ward = false;
bot.steal = false;

local route = {
	Vector(-576.000000, -4160.000000, 0.000000),
	Vector(384.000000, -2880.000000, 0.000000),
	Vector(1792.000000, 0.000000, 0.000000),
	Vector(3200.000000, -576.000000, 0.000000)
}

local route2 = {
	Vector(-3584.000000, 3776.000000, 0.000000),
	Vector(-4736.000000, 1728.000000, 0.000000),
	Vector(-4096.000000, -64.000000, 0.000000)
	--Vector(3957.000000, -2808.000000, 0.000000)
}

local vNonStuck = Vector(-2610.000000, 538.000000, 0.000000);

local chat = false;
local height = -1;

function GetWardItemIndex()
	for i = 0,8 do
		local item = bot:GetItemInSlot(i);
		if item ~= nil then
			local itemName = item:GetName();
			if itemName == 'item_ward_observer' or itemName == 'item_ward_dispenser' then
				return item;
			end
		end
	end
	return nil;
end

function GetDesireNew()
	--Should I think about warding at all?
	if 
		bot:IsHero() == false
		or bot:IsAlive() == false
		or bot:IsIllusion() == true
		or bot:IsChanneling() == true
		or bot:IsInvulnerable() == true
		or bot:HasModifier('modifier_doom_bringer_doom') == true
		or bot:HasModifier('modifier_teleporting') == true
	then
		return BOT_MODE_DESIRE_NONE;
	end

	local wardItemIndex = GetWardItemIndex();
	if wardItemIndex == nil then
		return BOT_MODE_DESIRE_NONE;
	end

	local mode = bot:GetActiveMode();
	if mode == BOT_MODE_EVASIVE_MANEUVERS then
		return BOT_MODE_DESIRE_NONE;
	end

	--What's my best opportunity right now?
	local maximumAcceptableDistance = 7500;
	local castRange = 500 + mutil.CalcExtraCastRange(bot);
	-- local safeRange = 1300;
	-- local safeRangeSqr = safeRange * safeRange;
	local significantRange = 1800;
	local traceCoolDownPeriod = 40.0;
	local expectedEnemySpeed = 380;
	local desiredDistanceAdvance = 600;

	local spots = wardUtils.GetAvailableSpot(bot);
	local bestSpotIndex = nil;
	local maxSpotDesire = BOT_ACTION_DESIRE_NONE;
	local enemyPids = GetTeamPlayers(GetOpposingTeam());

	for spotIndex, spot in pairs(spots) do
		local fromMeToSpot = GetUnitToLocationDistance(bot, spot);
		local initialDesire = RemapValClamped(
			fromMeToSpot,
			castRange,
			maximumAcceptableDistance,
			BOT_ACTION_DESIRE_VERYHIGH,
			BOT_ACTION_DESIRE_NONE 
		);

		local desire = initialDesire;
		
		if desire > maxSpotDesire then
			for i = 1, #enemyPids do
				local table = GetHeroLastSeenInfo(enemyPids[i]);
				local info = table[1];
				local fromEnemyToSpot = utils.GetDistance(info.location, spot);
				-- Consider worst case - enemy moving right towards spot
				-- But once reached, started going somewhere else
				fromEnemyToSpot = math.abs(fromEnemyToSpot - info.time_since_seen * expectedEnemySpeed);

				local traceDistanceWeight = RemapValClamped(
					fromEnemyToSpot,
					0,   significantRange,
					1.0, 0.0
				);
				local traceFreshnessWeight = RemapValClamped(
					info.time_since_seen,
					0,   traceCoolDownPeriod,
					1.0, 0.0
				);
				local advance = fromMeToSpot - fromEnemyToSpot;
				local advanceFactor = RemapValClamped(
					advance,
					0,   desiredDistanceAdvance,
					1.0, 0.0
				);
				local traceWeight = traceDistanceWeight * traceFreshnessWeight * advanceFactor;
				desire = desire - inititalDesire * traceWeight;
				if desire <= 0 then break end
			end

			if desire > maxSpotDesire then
				maxSpotDesire = desire;
				bestSpotIndex = spotIndex;
			end
		end
	end

	if maxSpotDesire == BOT_ACTION_DESIRE_NONE then
		return BOT_ACTION_DESIRE_NONE
	end

	--Is this opportunity the best right now?

	--Possible implementation: (1 - retreat_desire) * maxSpotDesire
	--But this requires calculation of other desires to be clear
	if mode == BOT_MODE_RETREAT then
		local desiredDistanceToEnemy = 3000;
		
		local enemyPresence = 0.0;
		for _, pid in pairs(enemyPids) do
			local table = GetHeroLastSeenInfo(enemyPids[i]);
			local info = table[1];
			local distance = GetUnitToLocationDistance(bot, info.location) - info.time_since_seen * expectedEnemySpeed;
			local presence = RemapValClamped(
				distance,
				--150 - Melee attack range
				150, desiredDistanceToEnemy,
				1.0, 0
			);
			enemyPresence = enemyPresence + presence;
			if(enemyPresence >= 1) then
				enemyPresence = 1;
				break;
			end
		end
		local enemyPresenceFactor = 1 - enemyPresence;

		local hpFactor = RemapValClamped(
			bot:GetHealth()/bot:GetMaxHealth(),
			0.0, 0.20,
			0.0, 1.0
		);

		local distance = GetUnitToLocationDistance(bot, spots[bestSpotIndex]);
		local regeneratedHp = bot:GetHealthRegen() * (distance / bot:GetCurrentMovementSpeed());
		local regenFactor = RemapValClamped(
			(bot:GetHealth() + regeneratedHp) / bot:GetMaxHealth(),
			0.0, 0,50,
			1.0, 1.25
		);
		hpFactor = math.min(1.0, hpFactor * regenFactor);
		
		local dotFactor;
		if bot:WasRecentlyDamagedByAnyHero(3.1) then
			--The less the presence, the more likely we are having a dot
			--Don't have means to measure it yet, but DOT is generaly a very bad sign
			dotFactor = 0.6 * enemyPresenceFactor;
		else
			dotFactor = 1.0;
		end

		local movementSpeedFactor = RemapValClamped(
			bot:GetCurrentMovementSpeed() / expectedEnemySpeed,
			0.0, 				 1.0,
			enemyPresenceFactor, 1.0
		);

		maxSpotDesire = maxSpotDesire * enemyPresenceFactor * hpFactor * dotFactor * movementSpeedFactor;
	elseif
		bot:GetTarget() ~= nil
		and (
			mode == BOT_MODE_DEFEND_ALLY
			or mode == BOT_MODE_DEFEND_TOWER_TOP
			or mode == BOT_MODE_DEFEND_TOWER_MID
			or mode == BOT_MODE_DEFEND_TOWER_BOT
			or mode == BOT_MODE_ATTACK
			or mode == BOT_MODE_PUSH_TOWER_TOP
			or mode == BOT_MODE_PUSH_TOWER_MID
			or mode == BOT_MODE_PUSH_TOWER_BOT
		)
	then
		local maxArrivalTime = 40;
		local target = bot:GetTarget();

		local distance = GetUnitToUnitDistance(bot, target);
		local distanceFactor = RemapValClamped(
			distance,
			400, maximumAcceptableDistance,
			0.0, 1.0
		);

		local movementSpeedFactor = RemapValClamped(
			distance / bot:GetCurrentMovementSpeed(),
			0.0, maxArrivalTime,
			0.0, 1.75
		);
		distanceFactor = math.min(distanceFactor * movementSpeedFactor, 1.0);

		local targetHpFactor = RemapValClamped(
			target:GetHealth() / target:GetMaxHealth(),
			0.15, 0.6,
			1.0,  0.0
		);

		if target:IsHero() == true then
			local targetManaFactor = RemapValClamped(
				target:GetMana() / target:GetMaxMana(),
				0.0, 1.0,
				1.0, 1.4
			);
			targetHpFactor = math.min(targetHpFactor * targetManaFactor, 1.0);
		end

		maxSpotDesire = maxSpotDesire * distanceFactor * targetHpFactor;
	end

	-- BOT_MODE_ROSHAN
	-- Item cool down factor
	return maxSpotDesire;
end

function GetDesire()

	if bot:IsChanneling() or bot:IsIllusion() or bot:IsInvulnerable() or not bot:IsHero() or not IsSuitableToWard() 
	   or bot:GetCurrentActionType() == BOT_ACTION_TYPE_IDLE 
	then
		return BOT_MODE_DESIRE_NONE;
	end
	
	if DotaTime() < 0 then
		local enemies = bot:GetNearbyHeroes(500, true, BOT_MODE_NONE)
		if not IsSafelaneCarry() and bot:GetAssignedLane() ~= LANE_MID 
		   and ( (GetTeam() == TEAM_RADIANT and bot:GetAssignedLane() == LANE_TOP) 
		      or (GetTeam() == TEAM_DIRE and bot:GetAssignedLane() == LANE_BOT) 
			  or  role.IsSupport(bot:GetUnitName()) 
			  or ( bot:GetUnitName() == "npc_dota_hero_elder_titan" and DotaTime() > -59 ) 
			  or ( bot:GetUnitName() == 'npc_dota_hero_wisp' and DotaTime() > -59 )
			  ) 
		  and #enemies == 0 
		then
			bot.steal = true;
			return BOT_MODE_DESIRE_ABSOLUTE;
		end
	else	
		bot.steal = false;
	end
	
	itemWard = wardUtils.GetItemWard(bot);
	
	if itemWard ~= nil  then
		
		pinged, wt = wardUtils.IsPingedByHumanPlayer(bot);
		--wt = GetUnitHandleByID(bot.lastPlayerChat.text);
		if pinged then	
			return RemapValClamped(GetUnitToUnitDistance(bot, wt), 1000, 0, BOT_MODE_DESIRE_HIGH, BOT_MODE_DESIRE_VERYHIGH);
		end
		--[[if bot.lastPlayerChat ~= nil and string.find(bot.lastPlayerChat.text, "ward") then
			if GetTeamForPlayer(bot.lastPlayerChat.pid) == bot:GetTeam() then
				pinged = false;
				bot:ActionImmediate_Chat("OK I'll give you ward", false);
				bot.lastPlayerChat = nil;
			elseif GetTeamForPlayer(bot.lastPlayerChat.pid) ~= bot:GetTeam() then
				bot:ActionImmediate_Chat("You're using All Chat dude!", true);
				bot.lastPlayerChat = nil;
			end
		else
			bot.lastPlayerChat = nil;	
		end]]--
		
		AvailableSpots = wardUtils.GetAvailableSpot(bot);
		targetLoc, targetDist = wardUtils.GetClosestSpot(bot, AvailableSpots);
		if targetLoc ~= nil and DotaTime() > wardCastTime + 1.0 and IsEnemyCloserToWardLoc(targetLoc, targetDist) == false then
			bot.ward = true;
			modeEntryTime = DotaTime();
			return RemapValClamped(targetDist, 6000, 0, BOT_MODE_DESIRE_MODERATE, BOT_MODE_DESIRE_VERYHIGH);
		end
	else
		bot.lastPlayerChat = nil;
	end
	return BOT_MODE_DESIRE_NONE;
end

function OnStart()
	local wardSlot = -1;
	for i = 0,8 do
		local item = bot:GetItemInSlot(i);
		if item ~= nil and item:GetName() == 'item_ward_observer' then
			wardSlot = i;
			break;
		end
	end

	--bot:ActionImmediate_Chat('slot: ' .. wardSlot,false);

	if wardSlot >= 0 then
		-- bot:ActionImmediate_Chat('item ward name: ' .. itemWard:GetName(),false);
		-- bot:ActionImmediate_Chat('slot: ' .. wardSlot,false);
		if bot:GetItemSlotType(wardSlot) == ITEM_SLOT_TYPE_BACKPACK then
			-- bot:ActionImmediate_Chat('wards are in the backpack',false);
			local leastCostItem = FindLeastItemSlot();
			swapTime = DotaTime();
			bot:ActionImmediate_SwapItems(wardSlot, leastCostItem);
			return
			-- local active = bot:GetItemInSlot(leastCostItem);
			-- print(tostring(active:IsFullyCastable()));
		end
	end

	bot:ActionImmediate_Chat('enter',false);
end

function OnEnd()
	AvailableSpots = {};
	bot.steal = false;
	itemWard = nil;
	wt = nil;
	local wardSlot = bot:FindItemSlot('item_ward_observer');
	if wardSlot >=0 and wardSlot <= 5 then
		local mostCostItem = FindMostItemSlot();
		if mostCostItem ~= -1 then
			bot:ActionImmediate_SwapItems( wardSlot, mostCostItem );
			return
		end
	end

	bot:ActionImmediate_Chat("exit",false);
end

function Think()

	if  GetGameState()~=GAME_STATE_PRE_GAME and GetGameState()~= GAME_STATE_GAME_IN_PROGRESS then
		return;
	end
	
	if wt ~= nil then
		print("placing");
		bot:Action_UseAbilityOnEntity(itemWard, wt);
		return
	end
	
	if bot.ward then
		if targetDist <= nWardCastRange then
			OnStart();
			if  DotaTime() > swapTime + 7.0 then
				bot:Action_UseAbilityOnLocation(itemWard, targetLoc);
				wardCastTime = DotaTime();	
				return
			else
				if targetLoc.x == Vector(-2948.000000, 769.000000, 0.000000) then
					bot:Action_MoveToLocation(vNonStuck+RandomVector(300));
					return
				else	
					bot:Action_MoveToLocation(targetLoc+RandomVector(300));
					return
				end
			end
		else
			if targetLoc == Vector(-2948.000000, 769.000000, 0.000000) then
				bot:Action_MoveToLocation(vNonStuck);
				return
			else	
				bot:Action_MoveToLocation(targetLoc);
				return
			end
		end
	end
	
	if bot.steal == true then
		local stealCount = CountStealingUnit();
		smoke = HasItem('item_smoke_of_deceit');
		local loc = nil;
		
		if smoke ~= nil and chat == false then
			chat = true;
			bot:ActionImmediate_Chat("Let's steal the bounty rune!",false);
			return
		end
		
		if smoke ~= nil and smoke:IsFullyCastable() and not bot:HasModifier('modifier_smoke_of_deceit') then
			bot:Action_UseAbility(smoke);
			return
		end
		
		if GetTeam() == TEAM_RADIANT then
			for _,r in pairs(route) do
				if r ~= nil then
					loc = r;
					break;
				end
			end
		else
			for _,r in pairs(route2) do
				if r ~= nil then
					loc = r;
					break;
				end
			end
		end
		
		local allies = CountStealUnitNearLoc(loc, 300);
		
		if ( GetTeam() == TEAM_RADIANT and #route == 1 ) or ( GetTeam() == TEAM_DIRE and #route2 == 1 )  then
			bot:Action_MoveToLocation(loc);
			return
		elseif GetUnitToLocationDistance(bot, loc) <= 300 and allies < stealCount then
			bot:Action_MoveToLocation(loc);
			return	
		elseif GetUnitToLocationDistance(bot, loc) > 300 then
			bot:Action_MoveToLocation(loc);
			return
		else
			if GetTeam() == TEAM_RADIANT then
				table.remove(route,1);
			else
				table.remove(route2,1);
			end
		end
		
	end

end

function CountStealingUnit()
	local count = 0;
	for i,id in pairs(GetTeamPlayers(GetTeam())) do
		local unit = GetTeamMember(i);
		if IsPlayerBot(id) and unit ~= nil and unit.steal == true then
			count = count + 1;
		end
	end
	return count;
end

function  CountStealUnitNearLoc(loc, nRadius)
	local count = 0;
	for i,id in pairs(GetTeamPlayers(GetTeam())) do
		local unit = GetTeamMember(i);
		if unit ~= nil and unit.steal == true and GetUnitToLocationDistance(unit, loc) <= nRadius then
			count = count + 1;
		end
	end
	return count;
end

function FindLeastItemSlot()
	local minCost = 100000;
	local idx = -1;
	for i=0,5 do
		if bot:GetItemInSlot(i) ~= nil then
			local itemName = bot:GetItemInSlot(i):GetName();
			if 
				itemName ~= "item_aegis"
				and itemName ~= "item_ward_observer"
				and itemName ~= "item_ward_dispenser"
			then
				local cost = GetItemCost(itemName);
				if( cost < minCost ) then
					minCost = cost;
					idx = i;
				end
			end
		else
			return i;
		end
	end
	return idx;
end

function FindMostItemSlot()
	local maxCost = 0;
	local idx = -1;
	for i=6,8 do
		if  bot:GetItemInSlot(i) ~= nil  then
			local _item = bot:GetItemInSlot(i):GetName()
			if( GetItemCost(_item) > maxCost ) then
				maxCost = GetItemCost(_item);
				idx = i;
			end
		end
	end
	return idx;
end

function HasItem(item_name)
	for i=0,5  do
		local item = bot:GetItemInSlot(i); 
		if item ~= nil and item:GetName() == item_name then
			return item;
		end
	end
	return nil;
end

--check if the condition is suitable for warding
function IsSuitableToWard()
	local Enemies = bot:GetNearbyHeroes(1300, true, BOT_MODE_NONE);
	local mode = bot:GetActiveMode();
	if ( ( mode == BOT_MODE_RETREAT and bot:GetActiveModeDesire() >= BOT_MODE_DESIRE_HIGH )
		or mode == BOT_MODE_ATTACK
		or mode == BOT_MODE_RUNE 
		or mode == BOT_MODE_DEFEND_ALLY
		or mode == BOT_MODE_DEFEND_TOWER_TOP
		or mode == BOT_MODE_DEFEND_TOWER_MID
		or mode == BOT_MODE_DEFEND_TOWER_BOT
		or ( #Enemies >= 1 and IsIBecameTheTarget(Enemies) )
		or bot:WasRecentlyDamagedByAnyHero(5.0)
		) 
	then
		return false;
	end
	return true;
end

function IsIBecameTheTarget(units)
	for _,u in pairs(units) do
		if u:GetAttackTarget() == bot then
			return true;
		end
	end
	return false;
end

function IsSafelaneCarry()
	return 
		role.CanBeSafeLaneCarry(bot:GetUnitName()) and 
		(
			(GetTeam()==TEAM_DIRE and bot:GetAssignedLane()==LANE_TOP) 
			or
			(GetTeam()==TEAM_RADIANT and bot:GetAssignedLane()==LANE_BOT)  
		)	
end

function IsEnemyCloserToWardLoc(wardLoc, botDist)
	local enemyPids = GetTeamPlayers(GetOpposingTeam());
	for i = 1, #enemyPids do
		local info = GetHeroLastSeenInfo(enemyPids[i])
		if info ~= nil then
			local dInfo = info[1]; 
			if dInfo ~= nil and dInfo.time_since_seen < 3.0  and utils.GetDistance(dInfo.location, wardLoc) <  botDist
			then	
				return true;
			end
		end	
	end
	return false;
end

