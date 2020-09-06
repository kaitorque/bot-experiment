X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_urn_of_shadows",
-- 	"item_pipe",
-- 	"item_spirit_vessel",
-- 	"item_blink",
-- 	"item_lotus_orb",
-- 	"item_ultimate_scepter_2",
-- 	"item_heart"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_buckler",
	"item_ring_of_protection",
	"item_wind_lace",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots",
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_urn_of_shadows",
	"item_force_staff"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_pipe",
	"item_spirit_vessel",
	"item_blink",
	"item_lotus_orb",
	"item_heart",
	"item_black_king_bar",
	"item_shivas_guard",
	"item_crimson_guard",
	"item_vladimir",
	"item_solar_crest",
	"item_cyclone",
	"item_blade_mail",
	"item_assault",
	"item_sheepstick",
	"item_aether_lens",
	"item_rod_of_atos",
	"item_octarine_core"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Pudge Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,2,1,4,1,2,2,3,4,3,3,3,4},
	{2,1,1,2,1,4,1,2,2,3,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,8}, talents
);

return X