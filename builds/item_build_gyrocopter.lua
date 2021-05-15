X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_maelstrom",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter",
-- 	"item_satanic",
-- 	"item_butterfly",
-- 	"item_mjollnir",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_medallion_of_courage",
	"item_ring_of_basilius",
	"item_urn_of_shadows",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi",
	"item_tranquil_boots",
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_falcon_blade",
	"item_force_staff",
	"item_ghost",
	"item_maelstrom",
	"item_veil_of_discord",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_butterfly",
	"item_diffusal_blade",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_holy_locket",
	"item_lotus_orb",
	"item_manta",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sange_and_yasha",
	"item_satanic",
	"item_skadi",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 1, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Gyrocopter Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{2,1,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X