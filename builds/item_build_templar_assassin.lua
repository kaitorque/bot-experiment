X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_hurricane_pike",
-- 	"item_desolator",
-- 	"item_black_king_bar",
-- 	"item_bloodthorn",
-- 	"item_ultimate_scepter_2",
-- 	"item_blink"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_blight_stone",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi", 
	"item_travel_boots"
}

transItem = {
	"item_lesser_crit"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_hurricane_pike",
	"item_desolator",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_blink",
	"item_nullifier",
	"item_butterfly",
	"item_greater_crit",
	"item_manta",
	"item_sphere",
	"item_assault"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Templar Asssassin Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,3,1,4,1,2,2,2,4,2,3,3,4},
	{1,3,1,2,3,4,1,1,2,2,4,2,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,7}, talents
);

return X