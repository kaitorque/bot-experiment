X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_hood_of_defiance",
-- 	"item_bloodstone",
-- 	"item_pipe",
-- 	"item_lotus_orb",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_boots",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_hood_of_defiance",
	"item_veil_of_discord"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_bloodstone",
	"item_pipe",
	"item_lotus_orb",
	"item_shivas_guard",
	"item_octarine_core",
	"item_cyclone",
	"item_black_king_bar",
	"item_sheepstick",
	"item_dagon_5",
	"item_sphere",
	"item_blink",
	"item_glimmer_cape",
	"item_solar_crest"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Timbersaw Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,4,3,2,2,2,4,1,1,1,4},
	{3,2,3,1,3,4,3,2,2,2,4,1,1,1,4},
	{3,2,1,3,2,4,1,3,2,1,4,3,2,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X