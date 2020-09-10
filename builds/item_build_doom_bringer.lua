X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vanguard",
-- 	"item_blade_mail",
-- 	"item_invis_sword",
-- 	"item_kaya_and_sange",
-- 	"item_crimson_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard",
-- 	"item_silver_edge"
-- };	

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_wind_lace",
	"item_ring_of_protection"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_vanguard",
	"item_invis_sword",
	"item_ancient_janggo"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink",
	"item_black_king_bar",
	"item_blade_mail",
	"item_kaya_and_sange",
	"item_crimson_guard",
	"item_shivas_guard",
	"item_silver_edge",
	"item_refresher",
	"item_lotus_orb",
	"item_assault",
	"item_heart",
	"item_abyssal_blade",
	"item_solar_crest",
	"item_vladmir",
	"item_spirit_vessel",
	"item_pipe",
	"item_heavens_halberd"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Doom Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,2,2,2,4,2,3,3,3,4,1,1,1,4},
	{3,1,2,3,3,4,3,2,2,2,4,1,1,1,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X