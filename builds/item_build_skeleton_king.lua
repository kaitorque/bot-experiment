X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_armlet",
-- 	"item_echo_sabre",
-- 	"item_invis_sword",
-- 	"item_black_king_bar",
-- 	"item_silver_edge",
-- 	"item_ultimate_scepter_2",
-- 	"item_assault"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_blitz_knuckles"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots", 
	"item_power_treads_str"
}

transItem = {
	"item_armlet",
	"item_echo_sabre",
	"item_invis_sword"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_black_king_bar",
	"item_silver_edge",
	"item_assault",
	"item_radiance",
	"item_abyssal_blade",
	"item_blink",
	"item_heavens_halberd",
	"item_satanic",
	"item_blade_mail",
	"item_bloodthorn",
	"item_monkey_king_bar",
	"item_mjollnir",
	"item_shivas_guard",
	"item_refresher",
	"item_sheepstick"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Wraith King Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{1,3,1,3,1,4,1,2,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X