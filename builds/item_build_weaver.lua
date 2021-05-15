X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_desolator",
-- 	"item_black_king_bar",
-- 	"item_greater_crit",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly",
-- 	"item_hurricane_pike"
-- };			

earlyItem = {
	"item_blight_stone",
	"item_boots",
	"item_magic_wand",
	"item_urn_of_shadows",
	"item_falcon_blade",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_dragon_lance",
	"item_hood_of_defiance",
	"item_maelstrom",
	"item_medallion_of_courage",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_butterfly",
	"item_desolator",
	"item_diffusal_blade",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_gungir",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sange_and_yasha",
	"item_skadi",
	"item_sphere",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Weaver Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,2,1,2,4,2,1,1,1,4,3,3,3,4},
	{2,3,1,2,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X