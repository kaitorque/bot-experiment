X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_urn_of_shadows",
-- 	"item_arcane_boots",
-- 	"item_mekansm",
-- 	"item_holy_locket",
-- 	"item_spirit_vessel",
-- 	"item_glimmer_cape",
-- 	"item_guardian_greaves",
-- 	"item_ultimate_scepter_2",
-- 	"item_lotus_orb"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_headdress",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_urn_of_shadows",
	"item_mekansm",
	"item_helm_of_the_dominator",
	"item_ghost",
	"item_force_staff"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_holy_locket",
	"item_spirit_vessel",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_lotus_orb",
	"item_heavens_halberd",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_solar_crest",
	"item_monkey_king_bar",
	"item_satanic",
	"item_vladimir",
	"item_pipe",
	"item_sphere",
	"item_aeon_disk",
	"item_desolator",
	"item_heart",
	"item_greater_crit"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("IO Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,3,2,4,2,3,3,3,4,1,1,1,4},
	{1,2,2,3,3,4,2,3,2,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7}, talents
);

return X