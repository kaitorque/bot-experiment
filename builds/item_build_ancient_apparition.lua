X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_ultimate_scepter",
-- 	"item_glimmer_cape",
-- 	"item_force_staff",
-- 	"item_rod_of_atos",
-- 	"item_sheepstick",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };	

earlyItem = {
	"item_magic_wand",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots", 
	"item_arcane_boots",
}

transItem = {
	"item_force_staff",
	"item_urn_of_shadows"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_glimmer_cape",
	"item_rod_of_atos",
	"item_sheepstick",
	"item_hurricane_pike",
	"item_octarine_core",
	"item_lotus_orb",
	"item_vladimir",
	"item_cyclone",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_aeon_disk"
}

randItem = KUtil.getItem(item, 5, 0, 1, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Ancient Apparition Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,3,2,3,4,1,3,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8}, talents
);

return X