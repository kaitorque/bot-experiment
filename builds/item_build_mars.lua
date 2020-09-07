X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_vladmir",
-- 	"item_hood_of_defiance",
-- 	"item_heavens_halberd",
-- 	"item_pipe",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_lotus_orb"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_soul_ring",
	'item_orb_of_venom'
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
}

transItem = {
	"item_hood_of_defiance",
	"item_ancient_janggo",
	"item_armlet"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_vladmir",
	"item_heavens_halberd",
	"item_pipe",
	"item_black_king_bar",
	"item_lotus_orb"
	"item_desolator",
	"item_assault",
	"item_blink",
	"item_satanic",
	"item_sange_and_yasha",
	"item_blade_mail",
	"item_heart",
	"item_crimson_guard",
	"item_radiance",
	"item_solar_crest",
	"item_shivas_guard"
}

randItem = KUtil.getItem(item, 5, 1, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Mars Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{2,1,2,1,2,4,1,2,1,3,4,3,3,3,4},
	{2,3,3,2,1,4,2,3,2,3,4,1,1,1,4},
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,4,6,7}, talents
);

return X