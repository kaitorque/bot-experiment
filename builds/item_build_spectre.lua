X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vanguard",
-- 	"item_diffusal_blade",
-- 	"item_manta",
-- 	"item_abyssal_blade",
-- 	"item_radiance",
-- 	"item_heart"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_soul_ring"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_agi",
}

transItem = {
	"item_vanguard",
	"item_hand_of_midas",
	"item_ancient_janggo"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_diffusal_blade",
	"item_manta",
	"item_abyssal_blade",
	"item_radiance",
	"item_heart",
	"item_skadi",
	"item_butterfly",
	"item_blade_mail",
	"item_sheepstick",
	"item_monkey_king_bar",
	"item_black_king_bar",
	"item_refresher",
	"item_bloodthorn"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Spectre Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4},
	{1,2,1,3,1,4,1,3,2,3,4,2,3,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,6,7}, talents
);

return X