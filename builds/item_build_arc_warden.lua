X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_maelstrom",
-- 	"item_dragon_lance",
-- 	"item_invis_sword",
-- 	"item_black_king_bar",
-- 	"item_bloodthorn",
-- 	"item_mjollnir",
-- 	"item_silver_edge",
-- 	"item_hurricane_pike"
-- };

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_hand_of_midas"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots"
}

transItem = {
	"item_maelstrom",
	"item_dragon_lance",
	"item_invis_sword",
	"item_orchid"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_bloodthorn",
	"item_mjollnir",
	"item_silver_edge",
	"item_hurricane_pike",
	"item_sheepstick",
	"item_necronomicon_3",
	"item_manta",
	"item_nullifier"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Arc Warden Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{3,1,3,1,1,4,1,3,3,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,8}, talents
);

return X