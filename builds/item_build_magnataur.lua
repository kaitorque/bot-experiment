X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_echo_sabre",
-- 	"item_blink",
-- 	"item_black_king_bar",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_greater_crit"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str",
	"item_arcane_boots",
	"item_travel_boots"
}

transItem = {
	"item_echo_sabre",
	"item_force_staff"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_greater_crit",
	"item_assault",
	"item_silver_edge",
	"item_satanic",
	"item_sphere",
	"item_sheepstick",
	"item_bloodthorn",
	"item_butterfly",
	"item_heart",
	"item_guardian_greaves",
	"item_refresher",
	"item_vladimir",
	"item_pipe",
	"item_lotus_orb"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Magnus Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,1,1,1,4,1,2,2,2,4,3,3,3,4},
	{3,1,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X