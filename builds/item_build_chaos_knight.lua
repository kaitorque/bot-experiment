X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_armlet",
-- 	"item_echo_sabre",
-- 	"item_black_king_bar",
-- 	"item_manta",
-- 	"item_heart",
-- 	"item_ultimate_scepter_2",
-- 	"item_heavens_halberd"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_soul_ring",
	"item_boots"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str"
}

transItem = {
	"item_armlet",
	"item_echo_sabre",
	"item_hand_of_midas",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_manta",
	"item_heart",
	"item_heavens_halberd",
	"item_silver_edge",
	"item_assault",
	"item_monkey_king_bar",
	"item_sange_and_yasha",
	"item_abyssal_blade",
	"item_blink"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Chaos Knight Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{1,2,1,2,1,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X