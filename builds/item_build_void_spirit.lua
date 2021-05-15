X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_maelstrom",
-- 	"item_cyclone",
-- 	"item_lesser_crit",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard",
-- 	"item_greater_crit",
-- 	"item_mjollnir"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_regen",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str"
}

transItem = {
	"item_ancient_janggo",
	"item_lesser_crit",
	"item_maelstrom",
	"item_cyclone",
	"item_mage_slayer",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_bloodthorn",
	"item_desolator",
	"item_greater_crit",
	"item_mjollnir",
	"item_octarine_core",
	"item_radiance",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Void Spirit Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,4,3,2,1,1,4,2,2,2,4},
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X