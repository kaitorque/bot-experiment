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
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_power_treads_str",
}

transItem = {
	"item_cyclone",
	"item_invis_sword",
	"item_orb_of_corrosion",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_blade_mail",
	"item_glimmer_cape",
	"item_lotus_orb",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
	"item_yasha_and_kaya",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Elder Titan Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,1,1,4,1,3,3,3,4,3,2,2,4},
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{2,1,3,1,2,4,1,2,1,2,4,3,3,3,4},
	{2,1,2,2,1,4,2,3,3,3,4,3,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X;