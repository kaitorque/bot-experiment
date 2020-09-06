X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_ultimate_scepter",
-- 	"item_cyclone",
-- 	"item_blink",
-- 	"item_meteor_hammer",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_veil_of_discord"
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots"
}

transItem = {
	"item_force_staff",
	"item_hood_of_defiance"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_cyclone",
	"item_blink",
	"item_meteor_hammer",
	"item_shivas_guard",
	"item_octarine_core",
	"item_black_king_bar",
	"item_sheepstick",
	"item_radiance",
	"item_crimson_guard",
	"item_lotus_orb",
	"item_pipe",
	"item_aeon_disk"
}

randItem = KUtil.getItem(item, 5, 0, 1, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Sand King Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);

return X