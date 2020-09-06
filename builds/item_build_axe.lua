X = {}

local IBUtil  = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot  = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_vanguard",
-- 	"item_blink",
-- 	"item_blade_mail",
-- 	"item_crimson_guard",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_lotus_orb"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_protection",
	"item_boots",
	"item_ring_of_tarrasque"

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_tranquil_boots",
	"item_travel_boots"
}

transItem = {
	"item_vanguard",
	"item_invis_sword",
	"item_force_staff"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_blade_mail",
	"item_crimson_guard",
	"item_black_king_bar",
	"item_lotus_orb",
	"item_shivas_guard",
	"item_silver_edge",
	"item_pipe",
	"item_heavens_halberd",
	"item_assault",
	"item_heart"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Axe Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4},
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7}, talents
);

return X