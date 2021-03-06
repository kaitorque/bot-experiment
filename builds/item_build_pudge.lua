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
	"item_boots",
	"item_buckler",
	"item_magic_wand",
	"item_ring_of_protection",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_tranquil_boots",
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_aether_lens",
	"item_cyclone",
	"item_force_staff",
	"item_hood_of_defiance",
	"item_rod_of_atos",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_crimson_guard",
	"item_eternal_shroud",
	"item_heart",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

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