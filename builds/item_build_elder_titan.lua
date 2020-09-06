X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_pipe",
-- 	"item_blade_mail",
-- 	"item_yasha_and_kaya",
-- 	"item_cyclone",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str", 
	"item_arcane_boots"
}

transItem = {
	"item_urn_of_shadows",
	"item_invis_sword"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_pipe",
	"item_blade_mail",
	"item_yasha_and_kaya",
	"item_cyclone",
	"item_shivas_guard",
	"item_spirit_vessel",
	"item_solar_crest",
	"item_lotus_orb",
	"item_sheepstick",
	"item_glimmer_cape",
	"item_aeon_disk",
	"item_black_king_bar"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Elder Titan Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,1,1,4,1,3,3,3,4,3,2,2,4},
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{2,1,3,1,2,4,1,2,1,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X;