X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_urn_of_shadows",
-- 	"item_ancient_janggo",
-- 	"item_force_staff",
-- 	"item_spirit_vessel",
-- 	"item_black_king_bar",
-- 	"item_shivas_guard",
-- 	"item_sheepstick",
-- 	"item_hurricane_pike"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_boots",
	"item_wind_lace",
	"item_hand_of_midas"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_force_staff",
	"item_ancient_janggo",
	"item_urn_of_shadows",
	"item_veil_of_discord",
	"item_orchid"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_spirit_vessel",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_sheepstick",
	"item_hurricane_pike",
	"item_blink",
	"item_guardian_greaves",
	"item_lotus_orb",
	"item_cyclone",
	"item_solar_crest",
	"item_rod_of_atos",
	"item_glimmer_cape",
	"item_pipe",
	"item_bloodthorn",
	"item_sphere",
	"item_octarine_core",
	"item_refresher"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Invoker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,1,3,1,2,3,3,3,2,2,2,2,2,2,1,1,1},
	{1,2,1,2,1,2,1,2,3,2,2,2,3,3,3,1,1,1,3,3,3}
}

X["skills"] = IBUtil.GetBuildPattern(
	"invoker", 
	IBUtil.GetRandomBuild(X['builds']), skills, 
	{1,4,5,8}, talents
);

return X