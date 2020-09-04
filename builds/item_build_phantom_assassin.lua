X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_vanguard",
-- 	"item_desolator",
-- 	"item_black_king_bar",
-- 	"item_abyssal_blade",
-- 	"item_monkey_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_nullifier"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_blight_stone",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_agi"
}

transItem = {
	"item_vanguard",
	"item_basher"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_desolator",
	"item_black_king_bar",
	"item_abyssal_blade",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_bfury",
	"item_satanic",
	"item_vladimir",
	"item_assault",
	"item_skadi"
}

randItem = KUtil.getItem(item, 5, 1, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Phantom Assassin Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X