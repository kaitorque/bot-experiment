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
	"item_magic_wand",
	"item_soul_ring",
	"item_boots"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_travel_boots"
}

transItem = {
	"item_basher"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_radiance",
	"item_assault",
	"item_black_king_bar",
	"item_abyssal_blade",
	"item_mjollnir",
	"item_bloodthorn",
	"item_satanic",
	"item_heart",
	"item_butterfly",
	"item_sphere",
	"item_nullifier",
	"item_sheepstick",
	"item_solar_crest",
	"item_monkey_king_bar",
	"item_silver_edge",
	"item_blink"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

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