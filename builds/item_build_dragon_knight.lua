X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_invis_sword",
-- 	"item_black_king_bar",
-- 	"item_sange_and_yasha",
-- 	"item_assault",
-- 	"item_ultimate_scepter_2",
-- 	"item_heart",
-- 	"item_silver_edge"
-- };	

earlyItem = {
	"item_magic_wand",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str"
}

transItem = {
	"item_invis_sword"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_sange_and_yasha",
	"item_assault",
	"item_heart",
	"item_silver_edge",
	"item_greater_crit",
	"item_blink",
	"item_blade_mail",
	"item_nullifier",
	"item_bloodthorn",
	"item_monkey_king_bar",
	"item_mjollnir",
	"item_satanic"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Dragon Knight Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,2,1,3,3,4,2,2,2,4},
	{3,2,3,1,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X