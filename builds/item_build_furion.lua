X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_invis_sword",
-- 	"item_orchid",
-- 	"item_maelstrom",
-- 	"item_bloodthorn",
-- 	"item_black_king_bar",
-- 	"item_mjollnir",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_blight_stone",
	"item_boots",
	"item_ring_of_basilius",
	"item_gloves"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots"
}

transItem = {
	"item_invis_sword",
	"item_orchid",
	"item_maelstrom",
	"item_medallion_of_courage",
	"item_mekansm",
	"item_urn_of_shadows",
	"item_ancient_janggo",
	"item_force_staff"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_bloodthorn",
	"item_black_king_bar",
	"item_mjollnir",
	"item_silver_edge",
	"item_sheepstick",
	"item_vladmir",
	"item_solar_crest",
	"item_guardian_greaves",
	"item_meteor_hammer",
	"item_lotus_orb",
	"item_crimson_guard",
	"item_pipe",
	"item_spirit_vessel",
	"item_monkey_king_bar",
	"item_assault",
	"item_satanic",
	"item_blade_mail",
	"item_nullifier",
	"item_greater_crit"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Nature Prophet Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,3,1,3,4,3,2,2,2,4,1,1,1,4},
	{3,2,1,3,3,4,3,2,2,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X