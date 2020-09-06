X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_maelstrom",
-- 	"item_yasha_and_kaya",
-- 	"item_lesser_crit",
-- 	"item_shivas_guard",
-- 	"item_greater_crit",
-- 	"item_ultimate_scepter_2",
-- 	"item_sphere",
-- 	"item_mjollnir"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_travel_boots"
}

transItem = {
	"item_maelstrom",
	"item_lesser_crit",
	"item_ancient_janggo",
	"item_veil_of_discord"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_yasha_and_kaya",
	"item_shivas_guard",
	"item_greater_crit",
	"item_sphere",
	"item_mjollnir",
	"item_black_king_bar",
	"item_cyclone",
	"item_blade_mail",
	"item_blink",
	"item_bfury",
	"item_radiance",
	"item_manta",
	"item_octarine_core"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Ember Spirit Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,4,3,2,1,1,4,2,2,2,4},
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X