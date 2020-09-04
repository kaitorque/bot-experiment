X = {};

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_medallion_of_courage",
-- 	"item_hood_of_defiance",
-- 	"item_rod_of_atos",
-- 	"item_solar_crest",
-- 	"item_pipe",
-- 	"item_ultimate_scepter",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };	

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots",
	"item_phase_boots"
}

transItem = {
	"item_medallion_of_courage",
	"item_hood_of_defiance",
	"item_ancient_janggo",
	"item_helm_of_the_dominator"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_rod_of_atos",
	"item_solar_crest",
	"item_pipe",
	"item_shivas_guard",
	"item_monkey_king_bar",
	"item_vladimir",
	"item_assault",
	"item_sheepstick",
	"item_black_king_bar",
	"item_lotus_orb",
	"item_blink",
	"item_mjollnir"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Visage Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,3,2,2,4,2,3,3,3,4,1,1,1,4},
	{1,2,3,2,3,4,2,3,2,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8}, talents
);

return X