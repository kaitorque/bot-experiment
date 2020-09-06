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
	"item_magic_wand",
	"item_boots",
	"item_orb_of_venom",
	"item_soul_ring",
	"item_medallion_of_courage",
	"item_ring_of_health"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str",
}

transItem = {
	"item_vanguard",
	"item_hood_of_defiance",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blade_mail",
	"item_pipe",
	"item_crimson_guard",
	"item_shivas_guard",
	"item_octarine_core",
	"item_solar_crest",
	"item_lotus_orb",
	"item_guardian_greaves",
	"item_vladimir",
	"item_assault",
	"item_black_king_bar",
	"item_heavens_halberd",
	"item_heart",
	"item_radiance"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

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