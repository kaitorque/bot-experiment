X = {}

local IBUtil = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = { 
-- 	"item_magic_wand",
-- 	"item_arcane_boots",
-- 	"item_hand_of_midas",
-- 	"item_glimmer_cape",
-- 	"item_ultimate_scepter",
-- 	"item_cyclone",
-- 	"item_sheepstick",
-- 	"item_lotus_orb",
-- 	"item_ultimate_scepter_2",
-- 	"item_dagon_5"
-- };			

earlyItem = {
	"item_magic_wand",
	"item_boots",
	"item_soul_ring",
	"item_orb_of_venom",
	"item_ring_of_basilius",
	"item_hand_of_midas"
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots"
}

transItem = {
	"item_veil_of_discord",
	"item_force_staff",
	"item_ghost"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_glimmer_cape",
	"item_cyclone",
	"item_sheepstick",
	"item_lotus_orb",
	"item_dagon_5",
	"item_pipe",
	"item_solar_crest",
	"item_black_king_bar",
	"item_octarine_core",
	"item_crimson_guard",
	"item_guardian_greaves",
	"item_kaya_and_sange",
	"item_ethereal_blade",
	"item_aeon_disk",
	"item_aether_lens",
	"item_heavens_halberd",
	"item_vladmir",
	"item_spirit_vessel"
}

randItem = KUtil.getItem(item, 5, 0, 0, 0)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Ogre Magi Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,1,2,3,2,4,2,3,3,3,4,1,1,1,4},
	{2,1,2,1,2,4,2,1,1,3,4,3,3,3,4},
	{2,1,2,3,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {1,4,5,8}, talents
);

return X