X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_vanguard",
-- 	"item_blade_mail",
-- 	"item_pipe",
-- 	"item_crimson_guard",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_medallion_of_courage",
	"item_orb_of_venom",
	"item_ring_of_health",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str",
}

transItem = {
	"item_ancient_janggo",
	"item_hood_of_defiance",
	"item_vanguard",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_crimson_guard",
	"item_eternal_shroud",
	"item_guardian_greaves",
	"item_heart",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_radiance",
	"item_sange_and_yasha",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Bristleback Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,2,3,2,4,2,3,3,1,4,1,1,1,4},
	{2,3,2,3,2,4,2,1,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X