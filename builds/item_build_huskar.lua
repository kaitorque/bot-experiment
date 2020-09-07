X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_dragon_lance",
-- 	"item_lifesteal",
-- 	"item_black_king_bar",
-- 	"item_heavens_halberd",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_assault",
-- 	"item_satanic"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_armlet",
	"item_boots",
	"item_lifesteal"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_str",
	"item_travel_boots"
}

transItem = {
	"item_dragon_lance"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_heavens_halberd",
	"item_hurricane_pike",
	"item_assault",
	"item_satanic",
	"item_monkey_king_bar",
	"item_lotus_orb"
}

randItem = KUtil.getItem(item, 5, 1, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Huskar Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,2,1,2,4,2,3,3,3,4,1,1,1,4},
	{2,3,3,1,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X