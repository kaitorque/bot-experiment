X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_force_staff",
-- 	"item_heavens_halberd",
-- 	"item_rod_of_atos",
-- 	"item_mjollnir",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };			

earlyItem = {
	"item_blight_stone",
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_tranquil_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_cyclone",
	"item_force_staff",
	"item_ghost",
	"item_helm_of_the_dominator",
	"item_rod_of_atos",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_crimson_guard",
	"item_ethereal_blade",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_heavens_halberd",
	"item_hurricane_pike",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_mjollnir",
	"item_monkey_king_bar",
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

print("Snapfire Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{2,1,3,3,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7}, talents
);

return X