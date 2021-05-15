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
	"item_boots",
	"item_magic_wand",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_power_treads_agi",
	"item_travel_boots",
}

transItem = {
	"item_force_staff",
	"item_helm_of_the_dominator",
	"item_rod_of_atos",
	"item_urn_of_shadows",
	"item_veil_of_discord",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_blink",
	"item_bloodthorn",
	"item_crimson_guard",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_heavens_halberd",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_octarine_core",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_sphere",
	"item_spirit_vessel",
	"item_vladmir",
	"item_yasha_and_kaya",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

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