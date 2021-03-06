X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_aether_lens",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard",
-- 	"item_hurricane_pike"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots",
}

transItem = {
	"item_aether_lens",
	"item_cyclone",
	"item_force_staff",
	"item_ghost",
	"item_maelstrom",
	"item_orchid",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_blink",
	"item_bloodthorn",
	"item_glimmer_cape",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_refresher",
	"item_shivas_guard",
	"item_solar_crest",
	"item_spirit_vessel",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Winter Wyvern Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{1,2,2,3,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X