local items = require(GetScriptDirectory() .. "/ItemUtility" )
--local roles = require(GetScriptDirectory() .. "/RoleUtilityAlt" )
local role = require(GetScriptDirectory() .. "/RoleUtility" )

local bot = GetBot();

if bot:GetUnitName() == 'npc_dota_hero_monkey_king' then
	local trueMK = nil;
	for i, id in pairs(GetTeamPlayers(GetTeam())) do
		if IsPlayerBot(id) and GetSelectedHeroName(id) == 'npc_dota_hero_monkey_king' then
			local member = GetTeamMember(i);
			if member ~= nil then
				trueMK = member;
			end
		end
	end
	if trueMK ~= nil and bot ~= trueMK then
		print("Item Purchase "..tostring(bot).." isn't true MK")
		return;
	elseif trueMK == nil or bot == trueMK then
		print("Item Purchase "..tostring(bot).." is true MK")
	end
end

if bot:IsInvulnerable() or bot:IsHero() == false or bot:IsIllusion()
then
	return;
end

local purchase = "NOT IMPLEMENTED";

if bot:IsHero() then
	purchase = require(GetScriptDirectory() .. "/builds/item_build_" .. string.gsub(GetBot():GetUnitName(), "npc_dota_hero_", ""));
end

--Prevent meepo clone to perform item purchase
if  bot:GetUnitName() == 'npc_dota_hero_meepo' and DotaTime() > 0 then
	bot.clone = true;
	local item_count = 0;
	for i=0,5 do
		local item = bot:GetItemInSlot(i);
		if item ~= nil then
			item_count = item_count + 1;
		end
	end
	if item_count > 1  then
		bot.clone = false;	
	end
end

--Still failed to prevent arc warden tempest double to buy items so I checked it in Think() function
if bot:GetUnitName() == 'npc_dota_hero_arc_warden' and DotaTime() > -60 then
	bot.clone = false;
	if bot:HasModifier('modifier_arc_warden_tempest_double') then
		print("I'm arc warden clone")
		bot.clone = true;	
	end
end

if bot.clone == true then purchase = "NOT IMPLEMENTED"; end

if purchase == "NOT IMPLEMENTED" then return; end

--clone skill build to bot.abilities in reverse order 
--plus overcome the usage of the same memory address problem for bot.abilities in same heroes game which result in bot failed to level up correctly 
bot.itemToBuy = {};
bot.currentItemToBuy = nil;
bot.currentComponentToBuy = nil;
bot.currListItemToBuy = {};
bot.SecretShop = false;
bot.SideShop = false;
local unitName = bot:GetUnitName();

--Swap items order
for i=1, math.ceil(#purchase['items']/2) do
	bot.itemToBuy[i] = purchase['items'][#purchase['items']-i+1]; 
	bot.itemToBuy[#purchase['items']-i+1] = purchase['items'][i];
end

--[[bot.itemToBuy = {
	"item_tranquil_boots",
	"item_magic_wand",
};]]--

---add tango and healing salve as starting consumables item
---add stout shield + queling blade for melee carry and stout shield for melee non carry
if DotaTime() < 0 then
	if bot:GetPrimaryAttribute() == ATTRIBUTE_STRENGTH then
		bot.itemToBuy[#bot.itemToBuy+1] = 'item_bracer';
	elseif bot:GetPrimaryAttribute() == ATTRIBUTE_AGILITY then
		bot.itemToBuy[#bot.itemToBuy+1] = 'item_wraith_band';
	elseif bot:GetPrimaryAttribute() == ATTRIBUTE_INTELLECT then
		bot.itemToBuy[#bot.itemToBuy+1] = 'item_null_talisman';
	end
	if bot:GetAttackRange() < 320 and unitName ~= 'npc_dota_hero_templar_assassin' and unitName ~= 'npc_dota_hero_tidehunter' then
		if role.IsCarry(unitName) then
			bot.itemToBuy[#bot.itemToBuy+1] = 'item_quelling_blade';
			-- bot.itemToBuy[#bot.itemToBuy+1] = 'item_stout_shield';
		-- else
			-- bot.itemToBuy[#bot.itemToBuy+1] = 'item_stout_shield';
		end
	end
	bot.itemToBuy[#bot.itemToBuy+1] = 'item_flask';
	bot.itemToBuy[#bot.itemToBuy+1] = 'item_tango';
end
--------------------------------

---Update the status to prevent bots selling stout shield and queling blade
bot.buildBFury = false;
bot.buildVanguard = false;
bot.buildHoly = false;
bot.buildSilver = false;
bot.buildSpirit = false;
bot.buildHurricane = false;
bot.buildBloodthorn = false;
bot.buildMjollnir = false;
bot.buildGreaves = false;
bot.buildCyclone = false;
bot.buildVeil = false;
bot.buildEthereal = false;
bot.buildAssault = false;
bot.buildDaedalus = false;
bot.buildMonkey = false;
bot.buildSolar = false;
bot.buildBloodstone = false;
bot.buildDesolator = false;
bot.buildDrum = false;
bot.buildTranquil = false;
bot.buildVlad = false;
bot.buildMek = false;
bot.buildMaelstrom = false;
bot.buildCrimson = false;
bot.buildAbyssal = false;
bot.buildYK = false;
bot.buildKS = false;
bot.buildMedallion = false;
bot.buildPipe = false;
bot.buildManta = false;
bot.buildSY = false;
bot.buildMidas = false;
bot.buildArmlet = false;
bot.buildGlimmer = false;
bot.buildHeaddress = false;
bot.buildForce = false;
bot.buildHood = false;
bot.buildOblivion = false;
bot.buildEcho = false;
bot.buildBasilius = false;
bot.buildUrn = false;
bot.buildNecronomicon = false;
bot.buildOrchid = false;
bot.buildSoul = false;
bot.buildBuckler = false;
bot.buildScepter = false;
bot.buildScepter2 = false;
bot.buildBooster = false;
bot.buildOctarine = false;
bot.buildSkadi = false;
bot.buildPerseverance = false;
bot.buildRefresher = false;
bot.buildSphere = false;
bot.buildLotus = false;
bot.buildMeteor = false;
bot.buildSatanic = false;
bot.buildMask = false;
bot.buildShadow = false;
bot.buildHeart = false;

for i=1, math.ceil(#bot.itemToBuy/2) do
	if bot.itemToBuy[i] == "item_bfury" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_bfury" then
		bot.buildBFury = true;
	end
	if bot.itemToBuy[i] == "item_heart" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_heart" then
		bot.buildHeart = true;
	end
	if bot.itemToBuy[i] == "item_silver_edge" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_silver_edge" then
		bot.buildSilver = true;
	end
	if bot.itemToBuy[i] == "item_spirit_vessel" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_spirit_vessel" then
		bot.buildSpirit = true;
	end
	if bot.itemToBuy[i] == "item_hurricane_pike" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_hurricane_pike" then
		bot.buildHurricane = true;
	end
	if bot.itemToBuy[i] == "item_bloodthorn" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_bloodthorn" then
		bot.buildBloodthorn = true;
	end
	if bot.itemToBuy[i] == "item_mjollnir" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_mjollnir" then
		bot.buildMjollnir = true;
	end
	if bot.itemToBuy[i] == "item_guardian_greaves" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_guardian_greaves" then
		bot.buildGreaves = true;
	end
	if bot.itemToBuy[i] == "item_ethereal_blade" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_ethereal_blade" then
		bot.buildEthereal = true;
	end
	if bot.itemToBuy[i] == "item_greater_crit" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_greater_crit" then
		bot.buildDaedalus = true;
	end
	if bot.itemToBuy[i] == "item_solar_crest" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_solar_crest" then
		bot.buildSolar = true;
	end
	if bot.itemToBuy[i] == "item_cyclone" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_cyclone" then
		bot.buildCyclone = true;
	end
	if bot.itemToBuy[i] == "item_ancient_janggo" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_ancient_janggo" then
		bot.buildDrum = true;
	end
	if bot.itemToBuy[i] == "item_tranquil_boots" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_tranquil_boots" then
		bot.buildTranquil = true;
	end
	if bot.itemToBuy[i] == "item_veil_of_discord" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_veil_of_discord" then
		bot.buildVeil = true;
	end
	if bot.itemToBuy[i] == "item_vladimir" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_vladimir" then
		bot.buildVlad = true;
	end
	if bot.itemToBuy[i] == "item_assault" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_assault" then
		bot.buildAssault = true;
	end
	if bot.itemToBuy[i] == "item_mekansm" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_mekansm" then
		bot.buildMek = true;
	end
	if bot.itemToBuy[i] == "item_monkey_king_bar" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_monkey_king_bar" then
		bot.buildMonkey = true;
	end
	if bot.itemToBuy[i] == "item_maelstrom" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_maelstrom" then
		bot.buildMaelstrom = true;
	end
	if bot.itemToBuy[i] == "item_invis_sword" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_invis_sword" then
		bot.buildShadow = true;
	end
	if bot.itemToBuy[i] == "item_vanguard" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_vanguard" then
		bot.buildVanguard = true;
	end
	if bot.itemToBuy[i] == "item_ultimate_scepter" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_ultimate_scepter" then
		bot.buildScepter = true;
	end
	if bot.itemToBuy[i] == "item_ultimate_scepter_2" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_ultimate_scepter_2" then
		bot.buildScepter2 = true;
	end
	if bot.itemToBuy[i] == "item_soul_booster" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_soul_booster" then
		bot.buildBooster = true;
	end
	if bot.itemToBuy[i] == "item_octarine_core" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_octarine_core" then
		bot.buildOctarine = true;
	end
	if bot.itemToBuy[i] == "item_skadi" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_skadi" then
		bot.buildSkadi = true;
	end
	if bot.itemToBuy[i] == "item_soul_ring" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_soul_ring" then
		bot.buildSoul = true;
	end
	if bot.itemToBuy[i] == "item_buckler" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_buckler" then
		bot.buildBuckler = true;
	end
	if bot.itemToBuy[i] == "item_orchid" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_orchid" then
		bot.buildOrchid = true;
	end
	if bot.itemToBuy[i] == "item_oblivion_staff" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_oblivion_staff" then
		bot.buildOblivion = true;
	end
	if bot.itemToBuy[i] == "item_echo_sabre" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_echo_sabre" then
		bot.buildEcho = true;
	end
	if bot.itemToBuy[i] == "item_echo_sabre" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_echo_sabre" then
		bot.buildBasilius = true;
	end
	if bot.itemToBuy[i] == "item_urn_of_shadows" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_urn_of_shadows" then
		bot.buildUrn = true;
	end
	if bot.itemToBuy[i] == "item_necronomicon_3" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_necronomicon_3" then
		bot.buildNecronomicon = true;
	end
	if bot.itemToBuy[i] == "item_headdress" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_headdress" then
		bot.buildHeaddress = true;
	end
	if bot.itemToBuy[i] == "item_force_staff" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_force_staff" then
		bot.buildForce = true;
	end
	if bot.itemToBuy[i] == "item_hood_of_defiance" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_hood_of_defiance" then
		bot.buildHood = true;
	end
	if bot.itemToBuy[i] == "item_hand_of_midas" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_hand_of_midas" then
		bot.buildMidas = true;
	end
	if bot.itemToBuy[i] == "item_armlet" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_armlet" then
		bot.buildArmlet = true;
	end
	if bot.itemToBuy[i] == "item_glimmer_cape" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_glimmer_cape" then
		bot.buildGlimmer = true;
	end
	if bot.itemToBuy[i] == "item_crimson_guard" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_crimson_guard" then
		bot.buildCrimson = true;
	end
	if bot.itemToBuy[i] == "item_abyssal_blade" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_abyssal_blade" then
		bot.buildAbyssal = true;
	end
	if bot.itemToBuy[i] == "item_bloodstone" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_bloodstone" then
		bot.buildBloodstone = true;
	end
	if bot.itemToBuy[i] == "item_yasha_and_kaya" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_yasha_and_kaya" then
		bot.buildYK = true;
	end
	if bot.itemToBuy[i] == "item_kaya_and_sange" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_kaya_and_sange" then
		bot.buildKS = true;
	end
	if bot.itemToBuy[i] == "item_medallion_of_courage" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_medallion_of_courage" then
		bot.buildMedallion = true;
	end
	if bot.itemToBuy[i] == "item_pipe" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_pipe" then
		bot.buildPipe = true;
	end
	if bot.itemToBuy[i] == "item_manta" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_manta" then
		bot.buildManta = true;
	end
	if bot.itemToBuy[i] == "item_sange_and_yasha" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_sange_and_yasha" then
		bot.buildSY = true;
	end
	if bot.itemToBuy[i] == "item_satanic" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_satanic" then
		bot.buildSatanic = true;
	end
	if bot.itemToBuy[i] == "item_mask_of_madness" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_mask_of_madness" then
		bot.buildMask = true;
	end
	if bot.itemToBuy[i] == "item_holy_locket" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_holy_locket" then
		bot.buildHoly = true;
	end
	if bot.itemToBuy[i] == "item_pers" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_pers" then
		bot.buildPerseverance = true;
	end
	if bot.itemToBuy[i] == "item_refresher" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_refresher" then
		bot.buildRefresher = true;
	end
	if bot.itemToBuy[i] == "item_sphere" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_sphere" then
		bot.buildSphere = true;
	end
	if bot.itemToBuy[i] == "item_lotus_orb" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_lotus_orb" then
		bot.buildLotus = true;
	end
	if bot.itemToBuy[i] == "item_meteor_hammer" or bot.itemToBuy[#bot.itemToBuy-i+1] == "item_meteor_hammer" then
		bot.buildMeteor = true;
	end
end

--Temporary change phase boots to power thread due to behavior change
-- for i=1, #bot.itemToBuy do
	-- if bot.itemToBuy[i] == 'item_phase_boots' then
		-- bot.itemToBuy[i] = 'item_power_treads_str';
	-- end	
-- end	
--------------------------------------------------------------------------

--[[print(bot:GetUnitName())
for i=1, #bot.itemToBuy do
	print(bot.itemToBuy[i])
end]]--

local courier = nil;
local buytime = -90;
local check_time = -90;

--bot.currRole = roles.GetRole(unitName);

local lastItemToBuy = nil;
local CanPurchaseFromSecret = false;
local CanPurchaseFromSide = false;
local itemCost = 0;
local courier = nil;
local t3AlreadyDamaged = false;
local t3Check = -90;

--General item purchase logis
local function GeneralPurchase()

	--Cache all needed item properties when the last item to buy not equal to current item component to buy
	if lastItemToBuy ~= bot.currentComponentToBuy then
		lastItemToBuy = bot.currentComponentToBuy;
		bot:SetNextItemPurchaseValue( GetItemCost( bot.currentComponentToBuy ) );
		CanPurchaseFromSecret = IsItemPurchasedFromSecretShop(bot.currentComponentToBuy);
		CanPurchaseFromSide   = IsItemPurchasedFromSideShop(bot.currentComponentToBuy);
		itemCost = GetItemCost( bot.currentComponentToBuy );
		lastItemToBuy = bot.currentComponentToBuy ;
	end
	
	local cost = itemCost;
	
	--Save the gold for buyback whenever a tier 3 tower damaged or destroyed
	if t3AlreadyDamaged == false and DotaTime() > t3Check + 1.0 then
		for i=2, 8, 3 do
			local tower = GetTower(GetTeam(), i);
			if tower == nil or tower:GetHealth()/tower:GetMaxHealth() < 0.5 then
				t3AlreadyDamaged = true;
				break;
			end
		end
		t3Check = DotaTime();
	elseif t3AlreadyDamaged == true and bot:GetBuybackCooldown() <= 30 then
		cost = itemCost + bot:GetBuybackCost() + 100; 
		--( 200 + bot:GetNetWorth()/12 );
	end
	
	--buy the item if we have the gold
	if ( bot:GetGold() >= cost ) then
		
		if courier == nil and bot.courierAssigned == true then
			courier = GetCourier(bot.courierID);
		end
		
		--purchase done by courier for secret shop item
		if bot.SecretShop and courier ~= nil and GetCourierState(courier) == COURIER_STATE_IDLE and courier:DistanceFromSecretShop() == 0 then
			if courier:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS then
				bot.currentComponentToBuy = nil;
				bot.currListItemToBuy[#bot.currListItemToBuy] = nil; 
				courier.latestUser = bot;
				bot.SecretShop = false;
			    bot.SideShop = false;
				return
			end
		end
		
		--Get bot distance from side shop and secret shop
		local dSecretShop = bot:DistanceFromSecretShop();
		local dSideShop   = bot:DistanceFromSideShop();
		
		--Logic to decide in which shop bot have to purchase the item
		if CanPurchaseFromSecret and bot:DistanceFromSecretShop() > 0 then
			bot.SecretShop = true;
		-- if CanPurchaseFromSecret and CanPurchaseFromSide == false and bot:DistanceFromSecretShop() > 0 then
			-- bot.SecretShop = true;
		-- elseif CanPurchaseFromSecret and CanPurchaseFromSide and dSideShop < dSecretShop and dSideShop > 0 and dSideShop <= 2500 then
			-- bot.SideShop = true;
		-- elseif CanPurchaseFromSecret and CanPurchaseFromSide and dSideShop > dSecretShop and dSecretShop > 0 then
			-- bot.SecretShop = true;
		-- elseif CanPurchaseFromSecret and CanPurchaseFromSide and dSideShop > 2500 and dSecretShop > 0 then
			-- bot.SecretShop = true;
		-- elseif CanPurchaseFromSide and CanPurchaseFromSecret == false and bot:DistanceFromSideShop() > 0 and bot:DistanceFromSideShop() <= 2500 then
			-- bot.SideShop = true;
		else
			if bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS then
				bot.currentComponentToBuy = nil;
				bot.currListItemToBuy[#bot.currListItemToBuy] = nil; 
				bot.SecretShop = false;
				bot.SideShop = false;	
				return
			else
				print("[item_purchase_generic] "..bot:GetUnitName().." failed to purchase "..bot.currentComponentToBuy.." : "..tostring(bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy )))	
			end
		end	
	else
		bot.SecretShop = false;
		bot.SideShop = false;
	end
end

--Turbo Mode General item purchase logis
local function TurboModeGeneralPurchase()
	--Cache all needed item properties when the last item to buy not equal to current item component to buy
	if lastItemToBuy ~= bot.currentComponentToBuy then
		lastItemToBuy = bot.currentComponentToBuy;
		bot:SetNextItemPurchaseValue( GetItemCost( bot.currentComponentToBuy ) );
		itemCost = GetItemCost( bot.currentComponentToBuy );
		lastItemToBuy = bot.currentComponentToBuy ;
	end
	
	local cost = itemCost;
	
	--Save the gold for buyback whenever a tier 3 tower damaged or destroyed
	if t3AlreadyDamaged == false and DotaTime() > t3Check + 1.0 then
		for i=2, 8, 3 do
			local tower = GetTower(GetTeam(), i);
			if tower == nil or tower:GetHealth()/tower:GetMaxHealth() < 0.5 then
				t3AlreadyDamaged = true;
				break;
			end
		end
		t3Check = DotaTime();
	elseif t3AlreadyDamaged == true and bot:GetBuybackCooldown() <= 10 then
		cost = itemCost + bot:GetBuybackCost() + ( 100 + bot:GetNetWorth()/40 );
	end
	
	--buy the item if we have the gold
	if ( bot:GetGold() >= cost ) then
		if bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS then
			bot.currentComponentToBuy = nil;
			bot.currListItemToBuy[#bot.currListItemToBuy] = nil; 
			bot.SecretShop = false;
			bot.SideShop = false;	
			return
		else
			print("[item_purchase_generic] "..bot:GetUnitName().." failed to purchase "..bot.currentComponentToBuy.." : "..tostring(bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy )))	
		end
	end
end

local lastInvCheck = -90;
local fullInvCheck = -90;
local lastBootsCheck = -90;
local buyBootsStatus = false;
local addVeryLateGameItem = false
local buyRD = false;
local buyTP = false;
local buyBottle = false;

function ItemPurchaseThink()  
	
	if ( GetGameState() ~= GAME_STATE_PRE_GAME and GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS ) 
	then
		return;
	end
	
	if bot:HasModifier('modifier_arc_warden_tempest_double') then
		bot.itemToBuy = {};
		return
	end
	
	--replace tango with faerie fire for midlaner
	if DotaTime() < 0 and bot:DistanceFromFountain() == 0 and bot.theRole == "midlaner" and bot.currentItemToBuy == nil and GetGameMode() ~= GAMEMODE_1V1MID
	then
		local tango = bot:FindItemSlot("item_tango");
		if tango >= 0 then
			bot:ActionImmediate_SellItem(bot:GetItemInSlot(tango));
			bot.itemToBuy[#bot.itemToBuy+1] = "item_faerie_fire";
		end	
	end
	
	--add bottle to item to purchase for midlaner 
	if DotaTime() > 0 and DotaTime() < 15 and #bot.currListItemToBuy > 0 and GetGameMode() ~= GAMEMODE_1V1MID
	   and bot:GetAssignedLane() == LANE_MID and role["bottle"][unitName] == 1 and buyBottle == false
	then
		bot.currListItemToBuy[#bot.currListItemToBuy+1]  =  "item_bottle";
		bot.currentComponentToBuy = nil;
		buyBottle = true;
		return
	end
	
	--Update support availability status
	if role['supportExist'] == nil then role.UpdateSupportStatus(bot); end
	
	--Update invisible hero or item availability status
	if role['invisEnemyExist'] == false then role.UpdateInvisEnemyStatus(bot); end
	
	--Update boots availability status to make the bot start buy support item and rain drop
	if buyBootsStatus == false and DotaTime() > lastBootsCheck + 2.0 then buyBootsStatus = items.UpdateBuyBootStatus(bot); lastBootsCheck = DotaTime() end
	
	--purchase flying courier and support item
	if bot.theRole == 'support' then
		-- if DotaTime() < 0 and GetItemStockCount( "item_courier" ) > 0
		-- then
			-- bot:ActionImmediate_PurchaseItem( 'item_courier' );
		-- else
		if DotaTime() < 0 and bot:GetGold() >= GetItemCost( "item_smoke_of_deceit" ) 
			and GetItemStockCount( "item_smoke_of_deceit" ) > 1 and items.GetEmptyInventoryAmount(bot) >= 4 
		then
			bot:ActionImmediate_PurchaseItem("item_smoke_of_deceit"); 	
		elseif DotaTime() < 0 and bot:GetGold() >= GetItemCost( "item_clarity" ) and items.HasItem(bot, "item_clarity") == false 
		then
			bot:ActionImmediate_PurchaseItem("item_clarity");	
		elseif role['invisEnemyExist'] == true and buyBootsStatus == true and bot:GetGold() >= GetItemCost( "item_dust" ) 
			and items.GetEmptyInventoryAmount(bot) >= 4 and items.GetItemCharges(bot, "item_dust") < 1 and bot:GetCourierValue() == 0 
		then
			bot:ActionImmediate_PurchaseItem("item_dust"); 
		elseif GetItemStockCount( "item_ward_observer" ) > 1 and ( DotaTime() < 0 or ( DotaTime() > 0 and buyBootsStatus == true ) ) and bot:GetGold() >= GetItemCost( "item_ward_observer" ) 
			and items.GetEmptyInventoryAmount(bot) >= 3 and items.GetItemCharges(bot, "item_ward_observer") < 2  and bot:GetCourierValue() == 0
		then
			bot:ActionImmediate_PurchaseItem("item_ward_observer"); 
		end
	end
	
	if ( role['supportExist'] == false or ( role['supportExist'] == nil and DotaTime() > 0 ) ) and GetItemStockCount( "item_courier" ) > 0 then
		bot:ActionImmediate_PurchaseItem( 'item_courier' );	
	end
	
	--purchase courier when no support in team
	-- if DotaTime() < 0 and role['supportExist'] == false and GetItemStockCount( "item_courier" ) > 0 then 
		-- bot:ActionImmediate_PurchaseItem( 'item_courier' );
	-- end
	
	--purchase raindrop
	if buyRD == false and buyBootsStatus == true and GetItemStockCount( "item_infused_raindrop" ) > 0 and bot:GetGold() >= GetItemCost( "item_infused_raindrop" ) and items.HasItem(bot, 'item_boots')
	then
		if RollPercentage(25) == true 
		then
			bot:ActionImmediate_PurchaseItem("item_infused_raindrop"); 
			buyRD = true;
		end
	end
	
	---buy tom of knowledge
	if GetItemStockCount( "item_tome_of_knowledge" ) > 0 and bot:GetGold() >= GetItemCost( "item_tome_of_knowledge" ) and 
	   items.GetEmptyInventoryAmount(bot) >= 4 and role.IsTheLowestLevel(bot)
	then
		bot:ActionImmediate_PurchaseItem("item_tome_of_knowledge"); 
	end	
	  
	--sell early game item   
	if  ( GetGameMode() ~= 23 and DotaTime() > 20*60 and DotaTime() > fullInvCheck + 2.0 
	      and ( bot:DistanceFromFountain() == 0 or bot:DistanceFromSecretShop() == 0 ) ) 
		or ( GetGameMode() == 23 and DotaTime() > 10*60 and DotaTime() > fullInvCheck + 2.0  )
	then
		local emptySlot = items.GetEmptyInventoryAmount(bot);
		local slotToSell = nil;
		if emptySlot < 2 then
			for i=1,#items['earlyGameItem'] do
				local item = items['earlyGameItem'][i];
				local itemSlot = bot:FindItemSlot(item);
				if itemSlot >= 0 and itemSlot <= 8 then
					if item == "item_stout_shield" then
						if bot.buildVanguard == false  then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_vanguard" then
						if bot.buildVanguard == false and bot.buildCrimson == false and bot.buildAbyssal == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end	
					elseif item == "item_invis_sword" then
						if bot.buildSilver == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end	
					elseif item == "item_echo_sabre" then
						if bot.buildSilver == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end	
					elseif item == "item_urn_of_shadows" then
						if bot.buildSpirit == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_force_staff" then
						if bot.buildHurricane == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_dragon_lance" then
						if bot.buildHurricane == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_orchid" then
						if bot.buildBloodthorn == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_maelstrom" then
						if bot.buildMjollnir == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_mekansm" then
						if bot.buildGreaves == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_wind_lace" then
						if bot.buildCyclone == false and bot.buildDrum == false and bot.buildSolar == false and bot.buildTranquil == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ring_of_basilius" then
						if bot.buildVeil == false and bot.buildVlad == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ghost" then
						if bot.buildEthereal == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_buckler" then
						if bot.buildAssault == false and bot.buildMek == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_lesser_crit" then
						if bot.buildDaedalus == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_basher" then
						if bot.buildAbyssal == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_javelin" then
						if bot.buildMonkey == false and bot.buildMjollnir == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_medallion_of_courage" then
						if bot.buildSolar == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_hood_of_defiance" then
						if bot.buildPipe == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_kaya" then
						if bot.buildBloodstone == false and bot.buildYK == false and bot.buildKS == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_yasha" then
						if bot.buildManta == false and bot.buildYK == false and bot.buildSY == false and bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_blight_stone" then
						if bot.buildMedallion == false and bot.buildSolar == false and bot.buildDesolator == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_lifesteal" then
						if bot.buildSatanic == false and bot.buildMask == false and bot.buildVlad == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_gloves" then
						if bot.buildMidas == false and bot.buildArmlet == false and bot.buildGlimmer == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_cloak" then
						if bot.buildHood == false and bot.buildGlimmer == false and bot.buildPipe == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_blitz_knuckles" then
						if bot.buildMonkey == false and bot.buildShadow == false and bot.buildSilver == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_point_booster" then
						if bot.buildScepter== false and bot.buildScepter2 == false and bot.buildBooster == false and bot.buildOctarine == false
						and bot.buildBloodstone == false and bot.buildSkadi == false
						then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ring_of_protection" then
						if bot.buildBuckler== false and bot.buildAssault == false and bot.buildMek == false and bot.buildGreaves == false
						and bot.buildUrn == false and bot.buildSpirit == false and bot.buildSoul == false 
						then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ring_of_regen" then
						if bot.buildHeaddress == false and bot.buildMek == false and bot.buildPipe == false and bot.buildForce == false
						and bot.buildHood == false 
						then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_sobi_mask" then
						if bot.buildOblivion == false and bot.buildOrchid == false and bot.buildBloodthorn == false and bot.buildEcho == false 
						and bot.buildSilver == false and bot.buildBasilius == false and bot.buildVeil == false and bot.buildVlad == false 
						and bot.buildUrn == false and bot.buildSpirit == false and bot.buildNecronomicon == false and bot.buildDrum == false 
						and bot.buildMedallion == false and bot.buildSolar == false 
						then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ring_of_health" then
						if bot.buildPerseverance == false and bot.buildRefresher == false and bot.buildSphere == false and bot.buildLotus == false 
						and bot.buildMeteor == false and bot.buildBFury == false and bot.buildVanguard == false and bot.buildHood == false
						then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_headdress" then
						if bot.buildMek == false and bot.buildPipe == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ring_of_tarrasque" then
						if bot.buildHeart == false and bot.buildHoly == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_necronomicon" then
						if bot.buildNecronomicon == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_magic_wand" then
						if bot.buildHoly == false  then
							slotToSell = itemSlot;
							break;
						end	
					elseif item == "item_quelling_blade" then
						if bot.buildBFury == false then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_hand_of_midas" then
						if #bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_mask_of_madness" then
						if #bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_veil_of_discord" then
						if #bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_armlet" then
						if #bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_helm_of_the_dominator" then
						if #bot.itemToBuy <= 2 then
							slotToSell = itemSlot;
							break;
						end
					elseif item == "item_ancient_janggo" then
						local jg = bot:GetItemInSlot(itemSlot);
						if jg~=nil and jg:GetCurrentCharges() == 0 and #bot.itemToBuy <= 3 then
							slotToSell = itemSlot;
							break;
						end	
					else
						slotToSell = itemSlot;
						break;
					end
				end
			end
		end	
		if slotToSell ~= nil then
			bot:ActionImmediate_SellItem(bot:GetItemInSlot(slotToSell));
		end
		fullInvCheck = DotaTime();
	end
	
	--Sell non BoT boots when have BoT
	if DotaTime() > 30*60 and ( items.HasItem( bot, "item_travel_boots") or items.HasItem( bot, "item_travel_boots_2")) or items.HasItem( bot, "item_guardian_greaves")) and
	   ( bot:DistanceFromFountain() == 0 or bot:DistanceFromSecretShop() == 0 )
	then	
		for i=1,#items['earlyBoots']
		do
			local bootsSlot = bot:FindItemSlot(items['earlyBoots'][i]);
			if bootsSlot >= 0 then
				bot:ActionImmediate_SellItem(bot:GetItemInSlot(bootsSlot));
			end
		end
	end
	
	--Insert tp scroll to list item to buy and then change the buyTP flag so the bots don't reapeatedly add the tp scroll to list item to buy 
	if buyTP == false 
		-- and items.HasItem(bot, 'item_travel_boots') == false and items.HasItem(bot, 'item_travel_boots_2') == false 
		and DotaTime() > 0 and bot:GetCourierValue() == 0 and bot:FindItemSlot('item_tpscroll') == -1 
	then
		bot.currentComponentToBuy = nil;	
		bot.currListItemToBuy[#bot.currListItemToBuy+1] = 'item_tpscroll';
		buyTP = true;
		return
	end
	--Change the flag to buy tp scroll to false when it already has it in inventory so the bot can insert tp scroll to list item to buy whenever they don't have any tp scroll
	if buyTP == true and bot:FindItemSlot('item_tpscroll') > -1 then
		buyTP = false;
	end
	
	--Fill purchase table with super late game item
	if #bot.itemToBuy == 0 and addVeryLateGameItem == false then
		bot.itemToBuy = {
			'item_travel_boots_2',
			'item_moon_shard',	
		}
		if items.HasItem(bot, 'item_travel_boots') == false then
			bot.itemToBuy[#bot.itemToBuy+1] = 'item_travel_boots';
		end
		addVeryLateGameItem = true;
	end
	
	--No need to purchase item when no item to purchase in the list
	if #bot.itemToBuy == 0 then bot:SetNextItemPurchaseValue( 0 ); return; end
	
	--Get the next item to buy and break it to item components then add it to currListItemToBuy. 
	--It'll only done if the bot already has the item that formed from its component in their hero's inventory (not stash) to prevent unintended item combining
	if  bot.currentItemToBuy == nil and #bot.currListItemToBuy == 0 then
		bot.currentItemToBuy = bot.itemToBuy[#bot.itemToBuy];
		local tempTable = items.GetBasicItems({items.NormItemName(bot.currentItemToBuy)})
		for i=1,math.ceil(#tempTable/2) 
		do	
			bot.currListItemToBuy[i] = tempTable[#tempTable-i+1];
			bot.currListItemToBuy[#tempTable-i+1] = tempTable[i];
		end
		
	end
	
	--Check if the bot already has the item formed from its components in their inventory (not stash)
	if  #bot.currListItemToBuy == 0 and DotaTime() > lastInvCheck + 3.0 then
	    if items.IsItemInHero(bot.currentItemToBuy) or ( bot.currentItemToBuy == 'item_ultimate_scepter_2' and  bot:HasScepter() ) then
			bot.currentItemToBuy = nil; 
			bot.itemToBuy[#bot.itemToBuy] = nil;
		else
			lastInvCheck = DotaTime();
		end
	--Added item component to current item component to buy and do the purchase	
	elseif #bot.currListItemToBuy > 0 then
		if bot.currentComponentToBuy == nil then
			bot.currentComponentToBuy = bot.currListItemToBuy[#bot.currListItemToBuy]; 
		else
			if GetGameMode() == 23 then
				TurboModeGeneralPurchase();
			else
				GeneralPurchase();
			end	
		end
	end

end