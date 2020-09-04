X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_ultimate_scepter",
-- 	"item_kaya",
-- 	"item_hurricane_pike",
-- 	"item_kaya_and_sange",
-- 	"item_sheepstick",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };		

earlyItem = {
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_boots",
	"item_sobi_mask"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_kaya",
	"item_urn_of_shadows",
	"item_ghost"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_glimmer_cape",
	"item_hurricane_pike",
	"item_kaya_and_sange",
	"item_sheepstick",
	"item_octarine_core",
	"item_blink",
	"item_cyclone",
	"item_aether_lens",
	"item_spirit_vessel",
	"item_aeon_disk",
	"item_vladimir",
	"item_lotus_orb"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Disruptor Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,2,2,2,4,2,3,3,3,4,1,1,1,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
); 

return X