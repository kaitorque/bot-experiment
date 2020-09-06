X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_necronomicon_3",
-- 	"item_desolator",
-- 	"item_black_king_bar",
-- 	"item_abyssal_blade",
-- 	"item_ultimate_scepter_2",
-- 	"item_assault"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_sobi_mask",
	"item_ring_of_protection",
	"item_necronomicon"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str"
}

transItem = {
	"item_basher",
	"item_helm_of_the_dominator"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_necronomicon_3",
	"item_desolator",
	"item_black_king_bar",
	"item_abyssal_blade",
	"item_assault",
	"item_vladimir",
	"item_nullifier",
	"item_heavens_halberd",
	"item_sheepstick",
	"item_heart"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Lycan Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,1,4,1,3,3,2,4,2,2,2,4},
	{3,2,3,2,3,4,3,2,2,1,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X