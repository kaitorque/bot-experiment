X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_diffusal_blade",
-- 	"item_invis_sword",
-- 	"item_black_king_bar",
-- 	"item_skadi",
-- 	"item_ultimate_scepter_2",
-- 	"item_abyssal_blade",
-- 	"item_silver_edge"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_agi",
}

transItem = {
	"item_ancient_janggo",
	"item_basher",
	"item_echo_sabre",
	"item_hand_of_midas",
	"item_invis_sword",
	"item_orb_of_corrosion",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_butterfly",
	"item_diffusal_blade",
	"item_heavens_halberd",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_sange_and_yasha",
	"item_satanic",
	"item_silver_edge",
	"item_skadi",
	"item_sphere",
}

randItem = KUtil.getItem(item, 5, 0, 1, 1, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Slark Item: "..table.concat(X["items"],", "));


X["builds"] = {
	{2,3,1,1,1,4,1,2,2,2,4,3,3,3,4},
	{2,3,1,1,2,4,1,2,1,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8}, talents
);

return X