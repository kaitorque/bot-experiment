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
-- 	"item_yasha_and_kaya",
-- 	"item_lesser_crit",
-- 	"item_shivas_guard",
-- 	"item_greater_crit",
-- 	"item_ultimate_scepter_2",
-- 	"item_sphere",
-- 	"item_mjollnir"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_blight_stone",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_lesser_crit",
	"item_maelstrom",
	"item_veil_of_discord",
	"item_cyclone",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_bfury",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_desolator",
	"item_greater_crit",
	"item_gungir",
	"item_manta",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_octarine_core",
	"item_radiance",
	"item_sheepstick",
	"item_shivas_guard",
	"item_sphere",
	"item_yasha_and_kaya",
}

randItem = KUtil.getItem(item, 5, 1, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Ember Spirit Item: "..table.concat(X["items"],", "));

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