X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_vanguard",
-- 	"item_pipe",
-- 	"item_crimson_guard",
-- 	"item_lotus_orb",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- }	

earlyItem = {
	"item_boots",
	"item_buckler",
	"item_magic_wand",
	"item_ring_of_regen",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_cyclone",
	"item_helm_of_the_dominator",
	"item_mekansm",
	"item_rod_of_atos",
	"item_vanguard",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_blade_mail",
	"item_crimson_guard",
	"item_eternal_shroud",
	"item_guardian_greaves",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_radiance",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Underlord Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,3,1,2,1,4,2,2,4,2,3,3,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7}, talents
);

return X;