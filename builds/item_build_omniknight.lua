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
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots", 
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_force_staff",
	"item_mekansm",
	"item_orb_of_corrosion",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_blink",
	"item_crimson_guard",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_holy_locket",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_pipe",
	"item_radiance",
	"item_refresher",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

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