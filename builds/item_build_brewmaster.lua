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
-- 	"item_blink",
-- 	"item_ultimate_scepter",
-- 	"item_lotus_orb",
-- 	"item_shivas_guard",
-- 	"item_ultimate_scepter_2",
-- 	"item_radiance"
-- }; 

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_ring_of_basilius",
	"item_ring_of_protection",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_phase_boots",
	"item_power_treads_str",
}

transItem = {
	"item_ancient_janggo",
	"item_echo_sabre",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_abyssal_blade",
	"item_aeon_disk",
	"item_assault",
	"item_black_king_bar",
	"item_blink",
	"item_crimson_guard",
	"item_lotus_orb",
	"item_radiance",
	"item_sheepstick",
	"item_shivas_guard",
	"item_spirit_vessel",
	"item_solar_crest",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Brewmaster Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,1,3,1,4,1,3,3,2,4,2,2,2,4},
	{2,3,1,1,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,7}, talents
);

return X