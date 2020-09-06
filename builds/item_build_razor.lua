X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_dragon_lance",
-- 	"item_sange_and_yasha",
-- 	"item_black_king_bar",
-- 	"item_hurricane_pike",
-- 	"item_heart",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_dragon_lance",
	"item_medallion_of_courage"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_sange_and_yasha",
	"item_black_king_bar",
	"item_hurricane_pike",
	"item_heart",
	"item_butterfly",
	"item_cyclone",
	"item_satanic",
	"item_rod_of_atos",
	"item_assault",
	"item_sphere",
	"item_lotus_orb",
	"item_refresher",
	"item_skadi",
	"item_shivas_guard",
	"item_solar_crest",
	"item_heavens_halberd"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Razor Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,1,1,4,1,2,2,3,4,3,3,3,4},
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);
return X