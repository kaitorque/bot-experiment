X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_yasha",
-- 	"item_diffusal_blade",
-- 	"item_manta",
-- 	"item_abyssal_blade",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_skadi"
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
	"item_yasha",
	"item_hand_of_midas",
	"item_ancient_janggo",
	"item_mask_of_madness"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_diffusal_blade",
	"item_manta",
	"item_abyssal_blade",
	"item_butterfly",
	"item_skadi",
	"item_sange_and_yasha",
	"item_heavens_halberd",
	"item_bfury",
	"item_bloodthorn",
	"item_mjollnir",
	"item_black_king_bar",
	"item_monkey_king_bar",
	"item_silver_edge",
	"item_satanic"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Juggernaut Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X