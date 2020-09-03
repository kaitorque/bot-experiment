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
-- 	"item_force_staff",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter",
-- 	"item_orchid",
-- 	"item_bloodthorn",
-- 	"item_hurricane_pike",
-- 	"item_mjollnir",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_tranquil_boots"
}

transItem = {
	"item_force_staff",
	"item_maelstrom",
	"item_orchid"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_sphere",
	"item_black_king_bar",
	"item_ultimate_scepter",
	"item_bloodthorn",
	"item_hurricane_pike",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_guardian_greaves",
	"item_greater_crit",
	"item_glimmer_cape",
	"item_lotus_orb",
	"item_meteor_hammer"
}

randItem = KUtil.getItem(item, 5)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Windranger Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,2,1,3,4,2,2,1,1,4,1,3,3,4},
	{2,3,2,1,2,4,2,3,3,3,4,1,1,1,4},
	{3,2,2,1,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8}, talents
);

return X