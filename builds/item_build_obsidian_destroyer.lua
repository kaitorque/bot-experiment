X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_int",
-- 	"item_hurricane_pike",
-- 	"item_kaya",
-- 	"item_yasha_and_kaya",
-- 	"item_black_king_bar",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int"
}

transItem = {
	"item_force_staff",
	"item_kaya",
	"item_invis_sword"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_hurricane_pike",
	"item_yasha_and_kaya",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_sheepstick",
	"item_refresher",
	"item_blink",
	"item_bloodstone",
	"item_sphere",
	"item_assault"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Outworld Devourer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,1,3,3,4,3,2,1,2,4,2,1,1,4},
	{2,3,1,3,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X