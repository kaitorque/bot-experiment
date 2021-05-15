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
	"item_headdress",
	"item_magic_wand",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
}

transItem = {
	"item_force_staff",
	"item_ghost",
	"item_helm_of_the_dominator",
	"item_mekansm",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_desolator",
	"item_eternal_shroud",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_heart",
	"item_heavens_halberd",
	"item_holy_locket",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_monkey_king_bar",
	"item_pipe",
	"item_satanic",
	"item_shivas_guard",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

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