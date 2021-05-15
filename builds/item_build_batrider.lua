X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_blink",
-- 	"item_force_staff",
-- 	"item_black_king_bar",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_force_staff",
	"item_invis_sword",
	"item_cyclone",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_blink",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_octarine_core",
	"item_sheepstick",
	"item_shivas_guard",
}

randItem = KUtil.getItem(item, 5, 0, 1, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Batrider Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,3,3,4,3,1,1,2,4,2,2,2,4},
	{1,3,3,2,3,4,3,2,2,2,4,1,1,1,4},
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X