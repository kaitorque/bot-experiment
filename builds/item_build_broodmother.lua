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
	"item_ring_of_protection",
	"item_soul_ring",
	"item_ring_of_basilius"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
}

transItem = {
	"item_orchid",
	"item_medallion_of_courage",
	"item_helm_of_the_dominator",
	"item_medallion_of_courage"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_vladmir",
	"item_black_king_bar",
	"item_diffusal_blade",
	"item_bloodthorn",
	"item_butterfly",
	"item_assault",
	"item_monkey_king_bar",
	"item_blink",
	"item_silver_edge",
	"item_nullifier",
	"item_sphere",
	"item_pipe",
	"item_sheepstick",
	"item_solar_crest"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

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