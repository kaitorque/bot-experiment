X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_soul_ring",
-- 	"item_travel_boots",
-- 	"item_blink",
-- 	"item_aether_lens",
-- 	"item_kaya",
-- 	"item_dagon_5",
-- 	"item_kaya_and_sange",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };			

earlyItem = {
	"item_boots",
	"item_soul_ring",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_travel_boots"
}

transItem = {
	"item_force_staff",
	"item_kaya",
	"item_aether_lens",
	"item_cyclone",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_blink",
	"item_bloodstone",
	"item_dagon_5",
	"item_ethereal_blade",
	"item_glimmer_cape",
	"item_kaya_and_sange",
	"item_sheepstick",
	"item_shivas_guard",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Tinker Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,2,1,2,1,2,4,3,3,4,3,3,4},
	{1,2,1,3,3,3,4,3,2,2,2,4,1,1,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,8}, talents
);

return X