X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_hurricane_pike",
-- 	"item_manta",
-- 	"item_ethereal_blade",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_skadi"
-- };			

earlyItem = {
	"item_boots",
	"item_lifesteal",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots",
}

transItem = {
	"item_hand_of_midas",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_butterfly",
	"item_ethereal_blade",
	"item_hurricane_pike",
	"item_manta",
	"item_monkey_king_bar",
	"item_sange_and_yasha",
	"item_satanic",
	"item_skadi",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Morphling Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,2,3,2,2,4,4,1,1,1,4},
	{3,1,3,2,1,3,1,3,1,4,4,2,2,2,4},
	{3,1,1,3,2,1,3,1,3,2,2,2,4,4,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,7}, talents
);

return X