X = {}
local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_cyclone",
-- 	"item_blink",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard",
-- 	"item_hurricane_pike"
	
-- };			

earlyItem = {
	"item_magic_wand",
	"item_orb_of_venom",
	"item_boots",
	"item_urn_of_shadows"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_travel_boots",
	"item_tranquil_boots"
}

transItem = {
	"item_force_staff",
	"item_veil_of_discord"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_glimmer_cape",
	"item_cyclone",
	"item_blink",
	"item_shivas_guard",
	"item_hurricane_pike",
	"item_spirit_vessel",
	"item_black_king_bar",
	"item_lotus_orb",
	"item_aeon_disk"
}

randItem = KUtil.getItem(item, 5, 0, 1, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

print("Earth Spirit Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,1,3,1,4,1,3,3,3,4,2,2,2,4},
	{2,1,3,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,7}, talents
);

return X