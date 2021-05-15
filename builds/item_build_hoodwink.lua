X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_dragon_lance",
-- 	"item_orchid",
-- 	"item_black_king_bar",
-- 	"item_desolator",
-- 	"item_bloodthorn",
-- 	"item_ultimate_scepter_2",
-- 	"item_monkey_king_bar",
-- 	"item_hurricane_pike"
-- };

earlyItem = {
	"item_boots",
	"item_fluffy_hat",
	"item_magic_wand",
	"item_ring_of_basilius",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_cyclone",
	"item_dragon_lance",
	"item_falcon_blade",
	"item_force_staff",
	"item_lesser_crit",
	"item_maelstrom",
	"item_orchid",
	"item_rod_of_atos",
	"item_urn_of_shadows",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_desolator",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_gungir",
	"item_hurricane_pike",
	"item_monkey_king_bar",
	"item_pipe",
	"item_spirit_vessel",
	"item_vladmir",
}		

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Hoodwink Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,8}, talents
);

return X