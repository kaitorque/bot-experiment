X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_mekansm",
-- 	"item_ultimate_scepter",
-- 	"item_force_staff",
-- 	"item_guardian_greaves",
-- 	"item_glimmer_cape",
-- 	"item_sheepstick",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };	

earlyItem = {
	"item_boots",
	"item_headdress",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_force_staff",
	"item_helm_of_the_dominator",
	"item_medallion_of_courage",
	"item_mekansm",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Chen Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,4,3,1,1,2,4,2,2,2,4},
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7}, talents
);

return X