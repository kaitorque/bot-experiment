X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_veil_of_discord",
-- 	"item_force_staff",
-- 	"item_yasha_and_kaya",
-- 	"item_ultimate_scepter",
-- 	"item_octarine_core",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
	
-- };	

earlyItem = {
	"item_magic_wand",
	"item_wind_lace",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots",
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_veil_of_discord",
	"item_urn_of_shadows",
	"Helm of the Dominator"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_yasha_and_kaya",
	"item_octarine_core",
	"item_hurricane_pike",
	"item_shivas_guard",
	"item_spirit_vessel",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_lotus_orb",
	"item_sheepstick",
	"item_pipe",
	"item_vladimir",
	"item_crimson_guard",
	"item_heavens_halberd",
	"item_blink",
	"item_rod_of_atos",
	"item_black_king_bar",
	"item_sphere",
	"item_bloodthorn"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Venomancer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,2,1,4,1,2,2,3,4,3,3,3,4},
	{1,2,3,2,3,4,2,3,2,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7}, talents
);

return X;