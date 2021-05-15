local npcBot = GetBot();
local preferedSS = nil;
local RAD_SECRET_SHOP = GetShopLocation(GetTeam(), SHOP_SECRET )
local DIRE_SECRET_SHOP = GetShopLocation(GetTeam(), SHOP_SECRET2 )
local reason = "";
local have = false;

function GetDesire()

	if npcBot:IsChanneling() or npcBot:IsIllusion() or (string.find(GetBot():GetUnitName(), "monkey") and npcBot:IsInvulnerable()) then
		return BOT_MODE_DESIRE_NONE;
	end
	
	if not IsSuitableToBuy() then
		return BOT_MODE_DESIRE_NONE;
	end
	
	local invFull = true;
	
	for i=0,8 do 
		if npcBot:GetItemInSlot(i) == nil then
			invFull = false;
		end	
	end
	
	if invFull then
		if DotaTime() > 25*60 then
			have, itemSlot = HaveItemToSell();
			if have then
				preferedSS = GetPreferedSecretShop();
				if  preferedSS ~= nil then
					return RemapValClamped(  GetUnitToLocationDistance(npcBot, preferedSS), 6000, 0, 0.75, 1.0 );
				end	
			end
		end
		return BOT_MODE_DESIRE_NONE;
	end
	
	local npcCourier = GetCourier(0);	
	local cState = GetCourierState( npcCourier );
	
	if npcBot.SecretShop and cState ~= COURIER_STATE_MOVING  then
		preferedSS = GetPreferedSecretShop();
		if  preferedSS ~= nil and cState == COURIER_STATE_DEAD then
			return RemapValClamped(  GetUnitToLocationDistance(npcBot, preferedSS), 6000, 0, 0.5, 0.75 );
		else
			if preferedSS ~= nil and GetUnitToLocationDistance(npcBot, preferedSS) <= 2500 then
				return RemapValClamped(  GetUnitToLocationDistance(npcBot, preferedSS), 2500, 0, 0.5, 0.75 );
			end
		end
	end
	
	return BOT_MODE_DESIRE_NONE

end

function OnEnd()
	reason = "";
end

function Think()
	
	npcBot:Action_MoveToLocation(preferedSS);
	return
	
end

function HaveItemToSell()
	 local earlyGameItem = {
		 "item_tango_single",
		 "item_clarity",
		 "item_faerie_fire",
		 "item_tango",  
		 "item_flask", 
		 "item_infused_raindrop",
		 "item_quelling_blade", 
		 "item_stout_shield", 
		 "item_magic_wand",
		 "item_bottle",  
		 "item_soul_ring",  
		 "item_bracer",
		 "item_wraith_band",
		 "item_null_talisman", 
		 "item_dust",
		 "item_ward_observer",
		 "item_hand_of_midas",
		 "item_ancient_janggo",
		 "item_orb_of_venom",
		 "item_vanguard",
		 "item_invis_sword",
		 "item_urn_of_shadows",
		 "item_force_staff",
		 "item_dragon_lance",
		 "item_orchid",
		 "item_maelstrom",
		 "item_mekansm",
		 "item_wind_lace",
		 "item_echo_sabre",
		 "item_mask_of_madness",
		 "item_ring_of_basilius",
		 "item_veil_of_discord",
		 "item_ghost",
		 "item_buckler",
		 "item_lesser_crit",
		 "item_javelin",
		 "item_medallion_of_courage",
		 "item_kaya",
		 "item_blight_stone",
		 "item_hood_of_defiance",
		 "item_armlet",
		 "item_yasha",
		 "item_basher",
		 "item_headdress",
		 "item_gloves",
		 "item_ring_of_regen",
		 "item_sobi_mask",
		 "item_ring_of_protection",
		 "item_point_booster",
		 "item_helm_of_the_dominator",
		 "item_holy_locket",
		 "item_ring_of_health",
		 "item_lifesteal",
		 "item_blitz_knuckles",
		 "item_necronomicon",
		 "item_ring_of_tarrasque",
		 "item_cloak",
		 "item_orb_of_corrosion",
		 "item_fluffy_hat",
		 "item_falcon_blade",
		 "item_aether_lens",
		 "item_cyclone",
		 "item_mage_slayer",
		 "item_witch_blade",
		 "item_rod_of_atos",
	}
	local slotToSell = nil;
	for _,item in pairs(earlyGameItem) do
		local itemSlot = npcBot:FindItemSlot(item);
		if itemSlot >= 0 and itemSlot <= 8 then
			if item == "item_stout_shield" then
				if npcBot.buildVanguard == false  then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_quelling_blade" then --130
				if npcBot.buildBFury == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_ring_of_protection" then --175
				if npcBot.buildBuckler== false and npcBot.buildAssault == false and npcBot.buildVlad == false
				and npcBot.buildGreaves == false and npcBot.buildUrn == false and npcBot.buildSpirit == false 
				and npcBot.buildSoul == false 
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_ring_of_regen" then --175
				if npcBot.buildHeaddress == false and npcBot.buildMek == false and npcBot.buildPipe == false 
				and npcBot.buildForce == false and npcBot.buildHood == false and npcBot.buildHoly == false
				and npcBot.buildShroud == false and npcBot.buildGreaves == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_sobi_mask" then --175
				if npcBot.buildOblivion == false and npcBot.buildOrchid == false and npcBot.buildBloodthorn == false 
				and npcBot.buildEcho == false and npcBot.buildSilver == false and npcBot.buildBasilius == false 
				and npcBot.buildVeil == false and npcBot.buildVlad == false and npcBot.buildUrn == false 
				and npcBot.buildSpirit == false and npcBot.buildFalcon == false
				and npcBot.buildMedallion == false and npcBot.buildSolar == false 
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_wind_lace" then --250
				if npcBot.buildCyclone == false and npcBot.buildDrum == false and npcBot.buildSolar == false 
				and npcBot.buildTranquil == false and npcBot.buildWaker == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_fluffy_hat" then --250
				if npcBot.buildForce == false and npcBot.buildHurricane == false and npcBot.buildCorrosion == false 
				and npcBot.buildFalcon == false and npcBot.buildHoly == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_blight_stone" then --300
				if npcBot.buildMedallion == false and npcBot.buildSolar == false and npcBot.buildDesolator == false 
				and npcBot.buildCorrosion == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_buckler" then --425
				if npcBot.buildAssault == false and npcBot.buildVlad == false and npcBot.buildGreaves == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_ring_of_basilius" then --425
				if npcBot.buildVeil == false and npcBot.buildVlad == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_headdress" then --425
				if npcBot.buildMek == false and npcBot.buildPipe == false and npcBot.buildHoly == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_gloves" then --450
				if npcBot.buildMidas == false and npcBot.buildArmlet == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_magic_wand" then --450
				if npcBot.buildHoly == false  then
					slotToSell = itemSlot;
					break;
				end	
			elseif item == "item_cloak" then --500
				if npcBot.buildHood == false and npcBot.buildGlimmer == false and npcBot.buildPipe == false 
				and npcBot.buildShroud == false and npcBot.buildMage == false 
				then
					slotToSell = itemSlot;
					break;
				end
			-- elseif item == "item_ring_of_tarrasque" then --650
			-- 	if npcBot.buildHeart == false and npcBot.buildHoly == false then
			-- 		slotToSell = itemSlot;
			-- 		break;
			-- 	end
			elseif item == "item_ring_of_health" then --825
				if npcBot.buildPerseverance == false and npcBot.buildRefresher == false and npcBot.buildSphere == false 
				and npcBot.buildLotus == false and npcBot.buildMeteor == false and npcBot.buildBFury == false 
				and npcBot.buildVanguard == false and npcBot.buildHood == false and npcBot.buildShroud == false
				and npcBot.buildPipe == false and npcBot.buildCrimson == false and npcBot.buildAbyssal == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_urn_of_shadows" then --840
				if npcBot.buildSpirit == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_lifesteal" then --900
				if npcBot.buildSatanic == false and npcBot.buildMask == false and npcBot.buildVlad == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_orb_of_corrosion" then --925
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_blitz_knuckles" then --1000
				if npcBot.buildMonkey == false and npcBot.buildShadow == false and npcBot.buildSilver == false
				and npcBot.buildWitch == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_medallion_of_courage" then --1025
				if npcBot.buildSolar == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_javelin" then --1100
				if npcBot.buildMonkey == false and npcBot.buildMaelstrom == false and npcBot.buildMjollnir == false 
				and npcBot.buildGleipnir == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_falcon_blade" then --1100
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_point_booster" then --1200
				if npcBot.buildScepter== false and npcBot.buildScepter2 == false and npcBot.buildBooster == false 
				and npcBot.buildOctarine == false and npcBot.buildBloodstone == false and npcBot.buildSkadi == false
				then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_ancient_janggo" then --1475
				local jg = bot:GetItemInSlot(itemSlot);
				if jg~=nil and jg:GetCurrentCharges() == 0 and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end	
			elseif item == "item_ghost" then --1500
				if npcBot.buildEthereal == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_hood_of_defiance" then --1500
				if npcBot.buildPipe == false and npcBot.buildShroud == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_veil_of_discord" then --1525
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_mask_of_madness" then --1775
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_dragon_lance" then --1900
				if npcBot.buildHurricane == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_vanguard" then --1925
				if npcBot.buildCrimson == false and npcBot.buildAbyssal == false  then
					slotToSell = itemSlot;
					break;
				end	
			elseif item == "item_lesser_crit" then --1950
				if npcBot.buildDaedalus == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_mekansm" then --1975
				if npcBot.buildGreaves == false then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_kaya" then --2050
				if npcBot.buildBloodstone == false and npcBot.buildYK == false and npcBot.buildKS == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_yasha" then --2050
				if npcBot.buildManta == false and npcBot.buildYK == false and npcBot.buildSY == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			-- elseif item == "item_necronomicon" then --2050
			-- 	if npcBot.buildNecronomicon == false then
			-- 		slotToSell = itemSlot;
			-- 		break;
			-- 	end
			elseif item == "item_force_staff" then --2175
				if npcBot.buildHurricane == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_hand_of_midas" then --2200
				if #npcBot.itemToBuy <= 2 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_aether_lens" then --2275
				if npcBot.buildOctarine == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_helm_of_the_dominator" then --2350
				if npcBot.buildOverlord == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_armlet" then --2475
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_echo_sabre" then --2500
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_witch_blade" then --2600
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end	
			elseif item == "item_maelstrom" then --2700
				if npcBot.buildMjollnir == false and npcBot.buildGleipnir == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_cyclone" then --2725
				if npcBot.buildWaker == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_recipe_rod_of_atos" then --2750
				if npcBot.buildGleipnir == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_basher" then --2950
				if npcBot.buildAbyssal == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_invis_sword" then --3000
				if npcBot.buildSilver == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end	
			elseif item == "item_mage_slayer" then --3250
				if #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			elseif item == "item_orchid" then --3475
				if npcBot.buildBloodthorn == false and #npcBot.itemToBuy <= 4 then
					slotToSell = itemSlot;
					break;
				end
			else
				slotToSell = itemSlot;
				break;
			end
		end
	end
	if slotToSell ~= nil then
		return true, slotToSell;
	end
	return false, nil;
end

function GetPreferedSecretShop()
	if GetTeam() == TEAM_RADIANT then
		if GetUnitToLocationDistance(npcBot, DIRE_SECRET_SHOP) <= 2000 then
			return DIRE_SECRET_SHOP;
		else
			return RAD_SECRET_SHOP;
		end
	elseif GetTeam() == TEAM_DIRE then
		if GetUnitToLocationDistance(npcBot, RAD_SECRET_SHOP) <= 2000 then
			return RAD_SECRET_SHOP;
		else
			return DIRE_SECRET_SHOP;
		end
	end
	return nil;
end

function IsSuitableToBuy()
	local mode = npcBot:GetActiveMode();
	local Enemies = npcBot:GetNearbyHeroes(1600, true, BOT_MODE_NONE);
	if ( ( mode == BOT_MODE_RETREAT and npcBot:GetActiveModeDesire() >= BOT_MODE_DESIRE_HIGH )
		or mode == BOT_MODE_ATTACK
		or mode == BOT_MODE_DEFEND_ALLY
		or mode == BOT_MODE_DEFEND_TOWER_TOP
		or mode == BOT_MODE_DEFEND_TOWER_MID
		or mode == BOT_MODE_DEFEND_TOWER_BOT
		or Enemies ~= nil and #Enemies >= 2
		or ( Enemies ~= nil and #Enemies == 1 and Enemies[1] ~= nil and IsStronger(npcBot, Enemies[1]) )
		) 
	then
		return false;
	end
	return true;
end

function IsStronger(bot, enemy)
	local BPower = bot:GetEstimatedDamageToTarget(true, enemy, 4.0, DAMAGE_TYPE_ALL);
	local EPower = enemy:GetEstimatedDamageToTarget(true, bot, 4.0, DAMAGE_TYPE_ALL);
	return EPower > BPower;
end
