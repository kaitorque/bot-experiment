X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_maelstrom",
-- 	"item_black_king_bar",
-- 	"item_mjollnir",
-- 	"item_satanic",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots"
}

transItem = {
	"item_maelstrom",
	"item_hand_of_midas",
	"item_mask_of_madness"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_mjollnir",
	"item_satanic",
	"item_butterfly",
	"item_monkey_king_bar",
	"item_skadi",
	"item_diffusal_blade",
	"item_manta",
	"item_heavens_halberd",
	"item_silver_edge",
	"item_bloodthorn",
	"item_greater_crit",
	"item_refresher"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Faceless Void Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,3,1,3,4,3,1,1,2,4,2,2,2,4},
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{1,3,3,2,1,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X