X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_vanguard",
-- 	"item_pipe",
-- 	"item_crimson_guard",
-- 	"item_lotus_orb",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- }	

earlyItem = {
	"item_magic_wand",
	"item_buckler",
	"item_boots",
	"item_soul_ring"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_arcane_boots",
	"item_travel_boots"
}

transItem = {
	"item_vanguard",
	"item_mekansm",
	"item_helm_of_the_dominator"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_pipe",
	"item_crimson_guard",
	"item_lotus_orb",
	"item_shivas_guard",
	"item_octarine_core",
	"item_guardian_greaves",
	"item_vladimir",
	"item_radiance",
	"item_rod_of_atos",
	"item_solar_crest",
	"item_cyclone",
	"item_blade_mail",
	"item_sheepstick"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Underlord Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,3,1,2,1,4,2,2,4,2,3,3,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7}, talents
);

return X;