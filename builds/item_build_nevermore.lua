X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(3));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_invis_sword",
-- 	"item_black_king_bar",
-- 	"item_yasha_and_kaya",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_butterfly",
-- 	"item_hurricane_pike"
-- };		

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi", 
	"item_travel_boots"
}

transItem = {
	"item_dragon_lance",
	"item_invis_sword",
	"item_ancient_janggo"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_yasha_and_kaya",
	"item_silver_edge",
	"item_butterfly",
	"item_hurricane_pike",
	"item_greater_crit",
	"item_satanic",
	"item_abyssal_blade",
	"item_blink",
	"item_sange_and_yasha",
	"item_ethereal_blade",
	"item_shivas_guard",
	"item_manta",
	"item_assault",
	"item_sheepstick"
}		

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Shadow Fiend Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,1,2,1,2,1,2,4,3,4,3,3,3,4},
	{2,1,1,2,1,1,2,2,4,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X