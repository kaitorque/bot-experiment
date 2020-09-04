X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter",
-- 	"item_hurricane_pike",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core",
-- };	

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots",
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_ghost"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_glimmer_cape",
	"item_cyclone",
	"item_hurricane_pike",
	"item_sheepstick",
	"item_octarine_core",
	"item_blink",
	"item_aeon_disk",
	"item_shivas_guard",
	"item_kaya_sange",
	"item_rod_of_atos",
	"item_lotus_orb"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Jakiro Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,3,4,3,2,2,2,4,2,1,1,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{3,1,3,2,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X