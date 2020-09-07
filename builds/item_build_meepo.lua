X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

--[[ NOT SURE IF STILL AN ISSUE: warning if meepo does not have an item other than 
brown boots / power treads at any time he will think he 
is a clone and skill/item decisions will possilby break! ]]

-- X["items"] = { 
-- 	"item_power_treads",
-- 	"item_ultimate_scepter",
-- 	"item_blink",
-- 	"item_sheepstick",
-- 	"item_skadi",
-- 	"item_heart",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots"
}

transItem = {
	"item_invis_sword"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_sheepstick",
	"item_skadi",
	"item_heart",
	"item_octarine_core",
	"item_ethereal_blade",
	"item_silver_edge",
	"item_manta",
	"item_assault"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Meepo Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,4,2,2,3,2,3,3,4,3,1,1,1,4},
	{2,1,4,2,2,3,2,1,1,4,3,3,1,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "meepo", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X