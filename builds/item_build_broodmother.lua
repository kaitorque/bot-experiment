X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_ring_of_basilius",
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vladmir",
-- 	"item_orchid",
-- 	"item_black_king_bar",
-- 	"item_diffusal_blade",
-- 	"item_ultimate_scepter_2",
-- 	"item_bloodthorn",
-- 	"item_butterfly"
-- }

earlyItem = {
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_ring_of_protection",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_arcane_boots",
}

transItem = {
	"item_helm_of_the_dominator",
	"item_hood_of_defiance",
	"item_medallion_of_courage",
	"item_orb_of_corrosion",
	"item_orchid",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_bloodthorn",
	"item_butterfly",
	"item_diffusal_blade",
	"item_ethereal_blade",
	"item_guardian_greaves",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_pipe",
	"item_sheepstick",
	"item_silver_edge",
	"item_solar_crest",
	"item_sphere",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Broodmother Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,1,2,1,2,1,2,4,3,4,3,3,3,4},
	{2,1,1,2,3,4,1,1,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X