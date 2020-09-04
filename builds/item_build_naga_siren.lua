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
-- 	"item_manta",
-- 	"item_heart",
-- 	"item_butterfly",
-- 	"item_ultimate_scepter_2",
-- 	"item_radiance"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_agi",
	"item_travel_boots",
}

transItem = {
	"item_yasha",
	"item_invis_sword"
}

numMidItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_diffusal_blade",
	"item_manta",
	"item_heart",
	"item_butterfly",
	"item_radiance",
	"item_sheepstick",
	"item_bloodthorn",
	"item_assault",
	"item_silver_edge",
	"item_monkey_king_bar",
	"item_nullifier",
	"item_skadi"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)
X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Naga Siren Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{3,1,3,1,3,1,3,1,2,4,4,2,2,2,4},
	{3,1,3,2,3,4,3,1,1,1,4,2,2,2,4},
	{3,2,3,2,3,4,3,2,2,1,4,1,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X