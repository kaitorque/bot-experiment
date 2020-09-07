X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(2));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_sange_and_yasha",
-- 	"item_black_king_bar",
-- 	"item_skadi",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_travel_boots"
}

transItem = {
	"item_basher",
	"item_maelstrom"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_sange_and_yasha",
	"item_black_king_bar",
	"item_skadi",
	"item_butterfly",
	"item_monkey_king_bar",
	"item_diffusal_blade",
	"item_abyssal_blade",
	"item_satanic",
	"item_manta",
	"item_heavens_halberd",
	"item_bloodthorn",
	"item_greater_crit",
	"item_mjollnir",
	"item_blink"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Troll Warlord Item: "..table.concat(X["items"],", "));


X["builds"] = {
	{1,2,3,3,3,1,3,4,1,1,4,2,2,2,4},
	{1,2,3,3,3,4,3,1,1,1,4,3,3,3,4},
	{1,2,3,3,2,4,3,2,3,2,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8}, talents
);

return X