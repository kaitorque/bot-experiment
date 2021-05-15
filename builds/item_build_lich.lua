X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_glimmer_cape",
-- 	"item_ultimate_scepter",
-- 	"item_aether_lens",
-- 	"item_force_staff",
-- 	"item_hurricane_pike",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_basilius",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots"
}

transItem = {
	"item_aether_lens",
	"item_force_staff",
	"item_ghost",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_glimmer_cape",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_sheepstick",
	"item_solar_crest",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Lich Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,1,2,1,4,1,2,2,3,4,3,3,3,4},
	{1,2,1,3,1,4,1,2,2,3,4,2,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8}, talents
);

return X