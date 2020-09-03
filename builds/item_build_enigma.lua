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
-- 	"item_blink",
-- 	"item_black_king_bar",
-- 	"item_guardian_greaves",
-- 	"item_ultimate_scepter",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_hand_of_midas",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_mekansm",
	"item_invis_sword"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_black_king_bar",
	"item_guardian_greaves",
	"item_sheepstick",
	"item_octarine_core",
	"item_sphere",
	"item_refresher",
	"item_helm_of_the_dominator",
	"item_vladimir",
	"item_pipe",
	"item_aeon_disk"
}

randItem = KUtil.getItem(item, 5)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Enigma Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4},
	{2,1,2,3,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8}, talents
);

return X