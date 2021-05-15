X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_echo_sabre",
-- 	"item_blink",
-- 	"item_kaya_and_sange",
-- 	"item_assault",
-- 	"item_ultimate_scepter_2",
-- 	"item_greater_crit"
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
	"item_power_treads_str",
}

transItem = {
	"item_ancient_janggo",
	"item_echo_sabre",
	"item_force_staff",
	"item_invis_sword",
	"item_mask_of_madness",
	"item_cyclone",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_butterfly",
	"item_greater_crit",
	"item_heart",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_manta",
	"item_monkey_king_bar",
	"item_octarine_core",
	"item_pipe",
	"item_sange_and_yasha",
	"item_satanic",
	"item_silver_edge",
	"item_solar_crest",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 1, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Tiny Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,2,2,2,4,2,1,1,1,4,3,3,3,4},
	{3,1,2,1,2,4,1,2,1,2,4,3,3,3,4},
	{3,1,2,1,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X