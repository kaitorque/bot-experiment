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
-- 	"item_aether_lens",
-- 	"item_cyclone",
-- 	"item_kaya",
-- 	"item_kaya_and_sange",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };			

earlyItem = {
	"item_boots",
	"item_headdress",
	"item_magic_wand",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_tranquil_boots"
}

transItem = {
	"item_aether_lens",
	"item_cyclone",
	"item_force_staff",
	"item_kaya",
	"item_rod_of_atos",
	"item_urn_of_shadows",
	"item_veil_of_discord",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_blink",
	"item_bloodthorn",
	"item_glimmer_cape",
	"item_gungir",
	"item_hurricane_pike",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_mjollnir",
	"item_nullifier",
	"item_sheepstick",
	"item_shivas_guard",
	"item_sphere",
	"item_spirit_vessel",
	"item_wind_waker",
}

randItem = KUtil.getItem(item, 5, 0, 0, 1, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Dark Willow Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{1,2,3,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X