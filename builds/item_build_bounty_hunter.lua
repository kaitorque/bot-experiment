X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_medallion_of_courage",
-- 	"item_desolator",
-- 	"item_solar_crest",
-- 	"item_orchid",
-- 	"item_bloodthorn",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_dagon_5"
-- };

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_orb_of_venom",
	"item_wind_lace"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots"
}

transItem = {
	"item_medallion_of_courage",
	"item_ancient_janggo",
	"item_urn_of_shadows",
	"item_force_staff"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_desolator",
	"item_solar_crest",
	"item_orchid",
	"item_bloodthorn",
	"item_black_king_bar",
	"item_dagon_5",
	"item_monkey_king_bar",
	"item_assault",
	"item_abyssal_blade",
	"item_vladmir",
	"item_manta",
	"item_crimson_guard",
	"item_pipe",
	"item_sange_and_yasha",
	"item_sheepstick",
	"item_sphere",
	"item_moonshard",
	"item_heart",
	"item_nullifier",
	"item_spirit_vessel",
	"item_guardian_greaves",
	"item_lotus_orb"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Bounty Hunter Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,2,1,1,1,4,1,3,3,3,4,2,2,2,4},
	{3,2,2,1,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X