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
-- 	"item_diffusal_blade",
-- 	"item_abyssal_blade",
-- 	"item_skadi",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_orb_of_venom"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi"
}

transItem = {
	"item_basher",
	"item_lesser_crit",
	"item_echo_sabre"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_sange_and_yasha",
	"item_diffusal_blade",
	"item_abyssal_blade",
	"item_skadi",
	"item_butterfly",
	"item_manta",
	"item_black_king_bar",
	"item_monkey_king_bar",
	"item_greater_crit",
	"item_desolator",
	"item_nullifier",
	"item_bloodthorn",
	"item_bfury",
	"item_satanic"
}

randItem = KUtil.getItem(item, 5, 1, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Riki Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,1,3,3,4,3,2,2,2,4,1,1,1,4},
	{3,1,3,2,3,4,3,2,1,2,4,1,2,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X