X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_echo_sabre",
-- 	"item_invis_sword",
-- 	"item_sange_and_yasha",
-- 	"item_black_king_bar",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_basher",
	"item_echo_sabre",
	"item_invis_sword",
	"item_maelstrom",
	"item_orb_of_corrosion",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_bfury",
	"item_black_king_bar",
	"item_butterfly",
	"item_desolator",
	"item_diffusal_blade",
	"item_gungir",
	"item_heavens_halberd",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_sange_and_yasha",
	"item_satanic",
	"item_silver_edge",
	"item_skadi",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Monkey King Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,1,3,1,4,1,4,2,2,2,4},
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4},
	{3,1,2,1,1,4,1,3,3,3,4,2,2,2,4},
	{3,1,2,1,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8}, talents
);

return X