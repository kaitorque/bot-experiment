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
-- 	"item_holy_locket",
-- 	"item_pipe",
-- 	"item_guardian_greaves",
-- 	"item_kaya_and_sange",
-- 	"item_ultimate_scepter_2",
-- 	"item_lotus_orb"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_soul_ring",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_mekansm",
	"item_ancient_janggo"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_holy_locket",
	"item_pipe",
	"item_guardian_greaves",
	"item_kaya_and_sange",
	"item_lotus_orb",
	'item_glimmer_cape',
	"item_shivas_guard",
	"item_crimson_guard",
	"item_radiance",
	"item_cyclone",
	"item_aeon_disk",
	"item_refresher"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Omniknight Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7}, talents
);

return X