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
-- 	"item_ultimate_scepter",
-- 	"item_black_king_bar",
-- 	"item_manta",
-- 	"item_mjollnir",
-- 	"item_monkey_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_wind_lace"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi"
}

transItem = {
	"item_force_staff",
	"item_urn_of_shadows",
	"item_maelstrom",
	"item_veil_of_discord",
	"item_lesser_crit"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_manta",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_butterfly",
	"item_guardian_greaves",
	"item_blink",
	"item_glimmer_cape",
	"item_pipe",
	"item_spirit_vessel",
	"item_vladmir",
	"item_solar_crest",
	"item_rod_of_atos",
	"item_cyclone",
	"item_aeon_disk",
	"item_lotus_orb",
	"item_desolator",
	"item_greater_crit",
	"ïtem_sphere",
	"item_satanic",
	"item_diffusal_blade",
	"item_hurricane_pike"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Mirana Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,1,1,1,4,1,3,3,3,4,2,2,2,4},
	{3,2,1,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8}, talents
);

return X