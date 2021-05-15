X = {}

local IBUtil  = require(GetScriptDirectory() .. "/ItemBuildUtility");
local KUtil  = require(GetScriptDirectory() .. "/KaitorqueUtility");
local npcBot  = GetBot();
local talents = IBUtil.FillTalenTable(npcBot);
local skills  = IBUtil.FillSkillTable(npcBot, IBUtil.GetSlotPattern(1));

-- X["items"] = {
-- 	"item_magic_wand",
-- 	"item_phase_boots",
-- 	"item_blade_mail",
-- 	"item_holy_locket",
-- 	"item_kaya_and_sange",
-- 	"item_lotus_orb",
-- 	"item_ultimate_scepter_2",
-- 	"item_shivas_guard"
-- };

earlyItem = {
	"item_boots",
	"item_magic_wand",
	"item_orb_of_venom",
	"item_ring_of_protection",
}

numEarlyItem = KUtil.getNum(#earlyItem)

randEarlyItem = KUtil.getEarlyItem(earlyItem, numEarlyItem)

boot = {
	"item_arcane_boots",
	"item_phase_boots",
	"item_travel_boots",
}

transItem = {
	"item_buckler",
	"item_ancient_janggo",
	"item_force_staff",
	"item_helm_of_the_dominator",
	"item_medallion_of_courage",
	"item_orb_of_corrosion"
}

numTransItem = KUtil.getNum(#transItem)

randTranItem = KUtil.getEarlyItem(transItem, numTransItem)

randBoot = KUtil.getBoot(boot)

item = {
	"item_assault",
	"item_blade_mail",
	"item_blink",
	"item_crimson_guard",
	"item_eternal_shroud",
	"item_glimmer_cape",
	"item_heart",
	"item_heavens_halberd",
	"item_holy_locket",
	"item_kaya_and_sange",
	"item_lotus_orb",
	"item_pipe",
	"item_radiance",
	"item_sange_and_yasha",
	"item_shivas_guard",
	"item_skadi",
	"item_solar_crest",
	"item_spirit_vessel",
	"item_vladmir",
}

randItem = KUtil.getItem(item, 5, 0, 0, 0, 1, 1)

X["items"] = KUtil.getListItem(randEarlyItem,randBoot,randTranItem,randItem)

KUtil.chatItem(npcBot, X["items"]);

print("Abaddon Item: "..table.concat(X["items"],", "));

X["builds"] = {
	{2,3,2,3,2,4,2,3,3,1,4,1,1,1,4},
	{2,1,3,2,2,4,2,1,1,1,4,3,3,3,4}
}

X["skills"] = IBUtil.GetBuildPattern(
	  "normal", 
	  IBUtil.GetRandomBuild(X['builds']), skills, 
	  {2,3,6,8}, talents
);

return X