X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_invis_sword",
-- 	"item_greater_crit",
-- 	"item_kaya_and_sange",
-- 	"item_black_king_bar",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_armlet",
	"item_invis_sword",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_greater_crit",
	"item_heart",
	"item_heavens_halberd",
	"item_kaya_and_sange",
	"item_monkey_king_bar",
	"item_radiance",
	"item_sheepstick",
	"item_shivas_guard",
	"item_silver_edge",
	"item_sphere",
	"item_spirit_vessel",
	"item_refresher",
}

randItem = KUtil.getItem(item, 5, 1, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Kunkka Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,3,3,3,4,1,1,1,4},
	{2,1,2,3,1,4,2,1,2,1,4,3,3,3,4},
	{2,1,1,3,3,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);

return X