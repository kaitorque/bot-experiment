X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_int",
-- 	"item_hurricane_pike",
-- 	"item_kaya",
-- 	"item_yasha_and_kaya",
-- 	"item_black_king_bar",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };			

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_wind_lace",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int",
	"item_tranquil_boots",
}

transItem = {
	"item_aether_lens",
	"item_ancient_janggo",
	"item_force_staff",
	"item_invis_sword",
	"item_kaya",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_bloodstone",
	"item_glimmer_cape",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_meteor_hammer",
	"item_octarine_core",
	"item_refresher",
	"item_sheepstick",
	"item_shivas_guard",
	"item_sphere",
	"item_yasha_and_kaya",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Outworld Devourer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,1,3,3,4,3,2,1,2,4,2,1,1,4},
	{2,3,1,3,3,4,3,1,1,1,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X