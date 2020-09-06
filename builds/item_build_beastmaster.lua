X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_boots",
-- 	"item_medallion_of_courage",
-- 	"item_necronomicon_3",
-- 	"item_solar_crest",
-- 	"item_vladmir",
-- 	"item_ultimate_scepter_2",
-- 	"item_heavens_halberd",
-- 	"item_travel_boots"
-- };

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_ring_of_protection",
	"item_ring_of_basilius"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_travel_boots"
}

transItem = {
	"item_force_staff",
	"item_medallion_of_courage",
	"item_helm_of_the_dominator",
	"item_ancient_janggo",
	"item_invis_sword"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_necronomicon_3",
	"item_solar_crest",
	"item_vladmir",
	"item_heavens_halberd",
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_silver_edge",
	"item_sheepstick",
	"item_heart"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Beastmaster Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X