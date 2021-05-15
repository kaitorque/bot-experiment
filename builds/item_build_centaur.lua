X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_tranquil_boots",
-- 	"item_vanguard",
-- 	"item_hood_of_defiance",
-- 	"item_blink",
-- 	"item_pipe",
-- 	"item_crimson_guard",
-- 	"item_ultimate_scepter",
-- 	"item_heart",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };	
			
earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_ring_of_health",
	"item_ring_of_protection",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str",
	"item_tranquil_boots",
	"item_travel_boots",
}

transItem = {
	"item_force_staff",
	"item_hood_of_defiance",
	"item_vanguard",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_crimson_guard",
	"item_heart",
	"item_lotus_orb",
	"item_pipe",
	"item_refresher",
	"item_shivas_guard",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Centaur Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,2,2,3,2,4,2,1,1,1,4,3,3,3,4},
	{1,3,2,2,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,3,5,8}, talents
);

return X