X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_pipe",
-- 	"item_aeon_disk",
-- 	"item_blink",
-- 	"item_ultimate_scepter",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_protection",
	"item_boots",
	"item_lifesteal",
	"item_ring_of_basilius"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_arcane_boots"
}

transItem = {
	"item_force_staff"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_pipe",
	"item_aeon_disk",
	"item_blink",
	"item_shivas_guard",
	"item_octarine_core",
	"item_vladimir",
	"item_guardian_greaves",
	"item_refresher",
	"item_solar_crest",
	"item_crimson_guard",
	"item_sheepstick",
	"item_assault"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Tidehunter Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,2,1,3,4,3,3,2,2,4,1,1,1,4},
	{1,3,1,2,3,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X