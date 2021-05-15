X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_boots",
-- 	"item_urn_of_shadows",
-- 	"item_arcane_boots",
-- 	"item_spirit_vessel",
-- 	"item_force_staff",
-- 	"item_glimmer_cape",
-- 	"item_holy_locket",
-- 	"item_ultimate_scepter_2",
-- 	"item_necronomicon_3",
-- 	"item_hurricane_pike"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_sobi_mask",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots"
}

transItem = {
	"item_aether_lens",
	"item_cyclone",
	"item_force_staff",
	"item_ghost",
	"item_lesser_crit",
	"item_ring_of_basilius",
	"item_urn_of_shadows",
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_aeon_disk",
	"item_black_king_bar",
	"item_bloodthorn",
	"item_crimson_guard",
	"item_desolator",
	"item_glimmer_cape",
	"item_guardian_greaves",
	"item_holy_locket",
	"item_hurricane_pike",
	"item_lotus_orb",
	"item_meteor_hammer",
	"item_nullifier",
	"item_pipe",
	"item_sheepstick",
	"item_shivas_guard",
	"item_solar_crest",
	"item_spirit_vessel",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Dazzle Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{1,3,3,2,3,4,3,2,2,2,4,1,1,1,4},
	{1,3,1,2,1,4,1,3,3,3,4,2,2,2,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,6,7}, talents
);

return X