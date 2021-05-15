X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_int",
-- 	"item_glimmer_cape",
-- 	"item_hurricane_pike",
-- 	"item_bloodthorn",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_sheepstick"
-- };		

earlyItem = {
	"item_boots",
	"item_magic_wand",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_int",
	"item_tranquil_boots"
}

transItem = {
	"item_cyclone",
	"item_force_staff",
	"item_ghost",
	"item_invis_sword",
	"item_rod_of_atos",
	"item_urn_of_shadows",
	"item_witch_blade",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_bloodthorn",
	"item_glimmer_cape",
	"item_gungir",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_refresher",
	"item_sheepstick",
	"item_silver_edge",
	"item_sphere",
	"item_wind_waker",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Silencer Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{1,2,3,1,1,4,1,3,3,3,4,2,2,2,4},
	{1,2,3,1,3,4,1,3,1,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,5,7}, talents
);

return X