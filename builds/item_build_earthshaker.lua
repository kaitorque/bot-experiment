X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_blink",
-- 	"item_ultimate_scepter",
-- 	"item_force_staff",
-- 	"item_kaya_and_sange",
-- 	"item_cyclone",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_octarine_core"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_soul_ring",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_tranquil_boots"
}

transItem = {
	"item_force_staff",
	"item_ghost",
	"item_soul_ring",
	"item_invis_sword"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_kaya_and_sange",
	"item_cyclone",
	"item_hurricane_pike",
	"item_octarine_core",
	"item_black_king_bar",
	"item_guardian_greaves",
	"item_greater_crit",
	"item_silver_edge",
	"item_sphere",
	"item_sheepstick",
	"item_aeon_disk",
	"item_heart"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Earthshaker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,3,3,3,4,3,1,1,1,4,2,2,2,4},
	{1,2,3,1,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,3,2,2,4,2,3,3,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8}, talents
);

return X