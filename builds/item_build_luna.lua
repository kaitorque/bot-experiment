X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_yasha",
-- 	"item_black_king_bar",
-- 	"item_manta",
-- 	"item_hurricane_pike",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_satanic"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_boots",
	"item_wind_lace"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots"
}

transItem = {
	"item_dragon_lance",
	"item_yasha",
	"item_urn_of_shadows",
	"item_force_staff",
	"item_medallion_of_courage",
	"item_helm_of_the_dominator",
	"item_mask_of_madness",
	"item_ancient_janggo"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_manta",
	"item_hurricane_pike",
	"item_butterfly",
	"item_satanic",
	"item_vladimir",
	"item_refresher",
	"item_spirit_vessel",
	"item_glimmer_cape",
	"item_pipe",
	"item_lotus_orb",
	"item_skadi",
	"item_sphere",
	"item_monkey_king_bar",
	"item_greater_crit"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)
X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Luna Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{3,1,1,3,1,4,1,2,2,2,4,2,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8}, talents
);

return X