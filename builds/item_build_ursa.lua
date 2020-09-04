X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vladmir",
-- 	"item_sange_and_yasha",
-- 	"item_blink",
-- 	"item_black_king_bar",
-- 	"item_abyssal_blade",
-- 	"item_ultimate_scepter",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_boots",
	"item_wind_lace",
	"item_ring_of_health"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_agi"
}

transItem = {
	"item_basher",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_vladmir",
	"item_sange_and_yasha",
	"item_blink",
	"item_black_king_bar",
	"item_abyssal_blade",
	"item_monkey_king_bar",
	"item_bfury",
	"item_satanic",
	"item_butterfly",
	"item_sheepstick",
	"item_silver_edge",
	"item_desolator",
	"item_bloodthorn",
	"item_nullifier",
	"item_manta"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Ursa Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,3,2,3,4,3,2,2,1,4,1,1,1,4},
	{3,1,3,2,1,4,3,1,3,1,4,2,2,2,4},
	{3,1,3,2,2,4,1,2,1,2,4,1,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8}, talents
);

return X