X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_orchid",
-- 	"item_black_king_bar",
-- 	"item_desolator",
-- 	"item_bloodthorn",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar",
-- 	"item_hurricane_pike"
-- };

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
}

transItem = {
	"item_dragon_lance",
	"item_orchid"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_desolator",
	"item_bloodthorn",
	"item_monkey_king_bar",
	"item_hurricane_pike",
	"item_sphere",
	"item_sheepstick",
	"item_blink",
	"item_diffusal_blade",
	"item_nullifier",
	"item_solar_crest",
	"item_mjollnir",
	"item_satanic"
}

randItem = KUtil.getItem(item, 5, 1, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Clinkz Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{2,3,2,1,2,4,2,1,1,1,4,3,3,3,4},
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8}, talents
);

return X