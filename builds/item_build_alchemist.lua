X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

--[[X["items"] = { 
	"item_poor_mans_shield",
	"item_magic_wand",
	"item_phase_boots",
	"item_vanguard",
	"item_maelstrom",
	"item_assault",
	"item_mjollnir",
	"item_abyssal_blade",
	"item_butterfly",
	"item_heart"
};]]--

-- X["items"] = { 
-- 	"item_phase_boots",
-- 	"item_radiance",
-- 	"item_assault",
-- 	"item_basher",
-- 	"item_black_king_bar",
-- 	"item_abyssal_blade",
-- 	"item_ultimate_scepter_2",
-- 	"item_mjollnir"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str",
	"item_travel_boots",
}

transItem = {
	"item_basher",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_assault",
	"item_bfury",
	"item_black_king_bar",
	"item_blink",
	"item_bloodthorn",
	"item_butterfly",
	"item_crimson_guard",
	"item_heart",
	"item_heavens_halberd",
	"item_lotus_orb",
	"item_mjollnir",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_pipe",
	"item_radiance",
	"item_sange_and_yasha",
	"item_satanic",
	"item_sheepstick",
	"item_silver_edge",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 1, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Alchemist Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4},
	{3,1,3,1,3,4,3,1,1,2,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);			

return X