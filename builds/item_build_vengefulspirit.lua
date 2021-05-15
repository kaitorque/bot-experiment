X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_medallion_of_courage",
-- 	"item_force_staff",
-- 	"item_aether_lens",
-- 	"item_solar_crest",
-- 	"item_ultimate_scepter",
-- 	"item_cyclone",
-- 	"item_hurricane_pike",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_boots",
	"item_buckler",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_dragon_lance",
	"item_force_staff",
	"item_helm_of_the_dominator",
	"item_hood_of_defiance",
	"item_medallion_of_courage",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_butterfly",
	"item_desolator",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_hurricane_pike",
	"item_manta",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sange_and_yasha",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Vengeful Spirit Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4},
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,2,3,3,4,2,3,2,3,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,8}, talents
);

return X