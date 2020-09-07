X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_mekansm",
-- 	"item_hood_of_defiance",
-- 	"item_holy_locket",
-- 	"item_pipe",
-- 	"item_ultimate_scepter",
-- 	"item_guardian_greaves",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int",
	"item_arcane_boots"
}

transItem = {
	"item_force_staff",
	"item_ghost",
	"item_mekansm",
	"item_hood_of_defiance",
	"item_veil_of_discord"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_holy_locket",
	"item_pipe",
	"item_guardian_greaves",
	"item_shivas_guard",
	"item_octarine_core",
	"item_radiance",
	"item_black_king_bar",
	"item_aeon_disk",
	"item_sheepstick",
	"item_kaya_and_sange",
	"item_sphere",
	"item_lotus_orb",
	"item_dagon_5",
	"item_blink",
	"item_rod_of_atos",
	"item_cyclone"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Necrophos Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4},
	{3,1,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X