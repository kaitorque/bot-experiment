X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_power_treads_agi",
-- 	"item_bfury",
-- 	"item_manta",
-- 	"item_abyssal_blade",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_heart"
-- };

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_gloves",
	"item_ring_of_health"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
}

transItem = {
	"item_force_staff",
	"item_medallion_of_courage"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_bfury",
	"item_manta",
	"item_abyssal_blade",
	"item_butterfly",
	"item_heart",
	"item_black_king_bar",
	"item_heavens_halberd",
	"item_skadi",
	"item_assault",
	"item_sphere",
	"item_monkey_king_bar"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Anti Mage Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,3,1,2,4,2,2,1,1,4,3,3,3,4},
	{1,2,1,3,1,4,1,2,2,2,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X