X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_power_treads_str",
-- 	"item_echo_sabre",
-- 	"item_blink",
-- 	"item_force_staff",
-- 	"item_black_king_bar",
-- 	"item_ultimate_scepter_2",
-- 	"item_heart"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_gloves",
	"item_boots",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_power_treads_str"
}

transItem = {
	"item_echo_sabre",
	"item_force_staff",
	"item_ancient_janggo",
	"item_invis_sword"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_blink"
	"item_black_king_bar",
	"item_heart",
	"item_assault",
	"item_vladimir",
	"item_solar_crest",
	"item_sange_and_yasha",
	"item_crimson_guard",
	"item_pipe",
	"item_lotus_orb",
	"item_silver_edge"
}

randItem = KUtil.getItem(item, 5, 0, 0, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Slardar Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{2,1,2,3,1,4,2,1,2,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,7}, talents
);

return X