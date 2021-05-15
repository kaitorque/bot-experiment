X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_sange_and_yasha",
-- 	"item_blade_mail",
-- 	"item_black_king_bar",
-- 	"item_abyssal_blade",
-- 	"item_butterfly"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_ancient_janggo",
	"item_basher",
	"item_cyclone",
	"item_hood_of_defiance",
	"item_invis_sword",
	"item_orb_of_corrosion",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_black_king_bar",
	"item_blade_mail",
	"item_butterfly",
	"item_eternal_shroud",
	"item_gungir",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_manta",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_radiance",
	"item_sange_and_yasha",
	"item_satanic",
	"item_sheepstick",
	"item_silver_edge",
	"item_skadi",
	"item_solar_crest",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Bloodseeker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,3,2,3,4,3,2,2,2,4,1,1,1,4},
	{1,3,3,2,2,4,3,2,3,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);

return X