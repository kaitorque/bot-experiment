X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_echo_sabre",
-- 	"item_sange_and_yasha",
-- 	"item_black_king_bar",
-- 	"item_blink",
-- 	"item_ultimate_scepter_2",
-- 	"item_greater_crit"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_power_treads_str",
}

transItem = {
	"item_echo_sabre",
	"item_force_staff",
	"item_hand_of_midas",
	"item_invis_sword",
	"item_mask_of_madness",
	"item_medallion_of_courage",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_bloodthorn",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_heart",
	"item_heavens_halberd",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_sange_and_yasha",
	"item_satanic",
	"item_sphere",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 1, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Sven Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,2,2,2,4,2,3,3,3,4,1,1,1,4},
	{1,3,1,2,1,4,1,2,2,2,4,3,3,3,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,5,7}, talents
);

return X