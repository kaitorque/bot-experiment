X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_dragon_lance",
-- 	"item_maelstrom",
-- 	"item_black_king_bar",
-- 	"item_hurricane_pike",
-- 	"item_mjollnir",
-- 	"item_greater_crit",
-- 	"item_monkey_king_bar"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_point_booster"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_tranquil_boots"
}

transItem = {
	"item_force_staff",
	"item_dragon_lance",
	"item_maelstrom",
	"item_veil_of_discord"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_hurricane_pike",
	"item_mjollnir",
	"item_greater_crit",
	"item_monkey_king_bar",
	"item_octarine_core",
	"item_sheepstick",
	"item_blink",
	"item_guardian_greaves",
	"item_aether_lens",
	"item_glimmer_cape",
	"item_lotus_orb",
	"item_sphere",
	"item_solar_crest",
	"item_cyclone",
	"item_vladimir",
	"item_spirit_vessel",
	"item_silver_edge",
	"item_bloodthorn",
	"item_satanic",
	"item_manta",
	"item_skadi"
}

randItem = KUtil.getItem(item, 5, 1, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Sniper Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X