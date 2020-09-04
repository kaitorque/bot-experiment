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
-- 	"item_pipe",
-- 	"item_guardian_greaves",
-- 	"item_blink",
-- 	"item_lotus_orb",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };

earlyItem = {
	"item_magic_wand",
	"item_soul_ring",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_mekansm",
	"item_helm_of_the_dominator",
	"item_ghost"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_pipe",
	"item_guardian_greaves",
	"item_blink",
	"item_lotus_orb",
	"item_shivas_guard",
	"item_holy_locket",
	"item_crimson_guard",
	"item_glimmer_cape",
	"item_sheepstick",
	"item_refresher"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Dark Seer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,2,3,2,1,2,1,4,1,4,1,3,3,4},
	{2,3,2,1,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8}, talents
);

return X