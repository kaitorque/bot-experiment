X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_blade_mail",
-- 	"item_echo_sabre",
-- 	"item_sange_and_yasha",
-- 	"item_invis_sword",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_str"
}

transItem = {
	"item_ancient_janggo",
	"item_invis_sword",
	"item_echo_sabre",
	"item_urn_of_shadows"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blade_mail",
	"item_sange_and_yasha",
	"item_silver_edge",
	"item_monkey_king_bar",
	"item_black_king_bar",
	"item_heavens_halberd",
	"item_vladimir",
	"item_spirit_vessel",
	"item_pipe",
	"item_crimson_guard",
	"item_assault",
	"item_heart"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Spirit Breaker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{1,3,1,2,3,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X