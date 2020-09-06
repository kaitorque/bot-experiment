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
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter",
-- 	"item_satanic",
-- 	"item_butterfly",
-- 	"item_mjollnir",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_agi"
}

transItem = {
	"item_maelstrom",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_satanic",
	"item_butterfly",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_manta",
	"item_sphere",
	"item_diffusal_blade"
}

randItem = KUtil.getItem(item, 5, 1, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Gyrocopter Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{2,1,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X