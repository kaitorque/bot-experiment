X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_maelstrom",
-- 	"item_heavens_halberd",
-- 	"item_basher",
-- 	"item_mjollnir",
-- 	"item_assault",
-- 	"item_abyssal_blade",
-- 	"item_monkey_king_bar"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_wind_lace"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots"
}

transItem = {
	"item_armlet",
	"item_basher",
	"item_maelstrom"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_heavens_halberd",
	"item_mjollnir",
	"item_assault",
	"item_abyssal_blade",
	"item_monkey_king_bar",
	"item_desolator",
	"item_manta",
	"item_sange_and_yasha",
	"item_black_king_bar",
	"item_heart",
	"item_radiance",
	"item_bloodthorn"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Lifestealer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,1,1,1,4,1,3,3,3,4,2,2,2,4},
	{2,3,1,1,1,4,1,2,2,2,4,3,3,3,4},
	{2,3,2,1,2,4,2,1,1,1,4,3,3,3,4},
	{2,3,2,1,1,4,1,1,3,3,4,3,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7}, talents
);

return X