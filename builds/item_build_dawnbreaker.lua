X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vladmir",
-- 	"item_hood_of_defiance",
-- 	"item_heavens_halberd",
-- 	"item_pipe",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_lotus_orb"
-- };

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_fluffy_hat",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_tranquil_boots",
}

transItem = {
	"item_ancient_janggo",
	"item_basher",
	"item_cyclone",
	"item_echo_sabre",
	"item_hood_of_defiance",
	"item_orb_of_corrosion",
	"item_sange",
	"item_urn_of_shadows",
	"item_veil_of_discord",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_crimson_guard",
	"item_desolator",
	"item_glimmer_cape",
	"item_greater_crit",
	"item_guardian_greaves",
	"item_heart",
	"item_heavens_halberd",
	"item_holy_locket",
	"item_lotus_orb",
	"item_monkey_king_bar",
	"item_pipe",
	"item_sange_and_yasha",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Dawnbreaker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{2,1,2,1,2,4,1,2,1,3,4,3,3,3,4},
	{2,3,3,2,1,4,2,3,2,3,4,1,1,1,4},
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X