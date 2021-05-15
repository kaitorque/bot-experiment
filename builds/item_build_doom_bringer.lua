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
	"item_boots",
	"item_magic_wand",
	"item_ring_of_protection",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_invis_sword",
	"item_vanguard",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_crimson_guard",
	"item_eternal_shroud",
	"item_heart",
	"item_heavens_halberd",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_pipe",
	"item_refresher",
	"item_shivas_guard",
	"item_silver_edge",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

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