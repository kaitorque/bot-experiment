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
	"item_boots",
	"item_hand_of_midas",
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_force_staff",
	"item_orchid",
	"item_urn_of_shadows",
	"item_veil_of_discord",
	"item_cyclone",
	"item_rod_of_atos",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_blink",
	"item_bloodthorn",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_refresher",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

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