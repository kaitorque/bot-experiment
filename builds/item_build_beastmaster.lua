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
	"item_boots",
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_ring_of_protection",
	"item_helm_of_the_dominator",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_force_staff",
	"item_invis_sword",
	"item_medallion_of_courage",
	"item_soul_ring",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_bloodstone",
	"item_eternal_shroud",
	"item_heart",
	"item_heavens_halberd",
	"item_kaya_and_sange",
	"item_sheepstick",
	"item_silver_edge",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

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