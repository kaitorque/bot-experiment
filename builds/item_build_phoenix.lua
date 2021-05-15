X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_veil_of_discord",
-- 	"item_shivas_guard",
-- 	"item_aeon_disk",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_ring_of_regen",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots",
}

transItem = {
	"item_cyclone",
	"item_ghost",
	"item_hand_of_midas",
	"item_rod_of_atos",
	"item_urn_of_shadows",
	"item_veil_of_discord",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_glimmer_cape",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_meteor_hammer",
	"item_sheepstick",
	"item_shivas_guard",
	"item_refresher",
	"item_spirit_vessel",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Phoenix Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,1,2,4,2,1,1,3,4,3,3,3,4},
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X