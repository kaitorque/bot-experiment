X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_int",
-- 	"item_veil_of_discord",
-- 	"item_blink",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_witch_blade",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int",
	"item_travel_boots",
}

transItem = {
	"item_force_staff",
	"item_veil_of_discord",
	"item_cyclone",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_baar",
	"item_blink",
	"item_dagon_5",
	"item_desolator",
	"item_ethereal_blade",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_kaya_and_sange",
	"item_mjollnir",
	"item_octarine_core",
	"item_refresher",
	"item_sheepstick",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
	"item_yasha_and_kaya",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Puck Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,1,2,2,4,1,2,1,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X