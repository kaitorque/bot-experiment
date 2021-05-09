local U = {};

--Keep in mind special cases:
--1)Warlock upheaval with shard
--2)Active blademail vs some of following heroes
local canDamageFromInvisWithoutRevealing = {
	"npc_dota_hero_doom_bringer",
	"npc_dota_hero_ember_spirit",
	"npc_dota_hero_razor",
	"npc_dota_hero_luna",
	"npc_dota_hero_dark_seer",
	"npc_dota_hero_death_prophet",
	"npc_dota_hero_grimstroke",
	"npc_dota_hero_leshrac",
	"npc_dota_hero_necrolyte",
	"npc_dota_hero_pudge",
	"npc_dota_hero_lich",
	"npc_dota_hero_gyrocopter",
	"npc_dota_hero_dark_willow",
	"npc_dota_hero_juggernaut",
	"npc_dota_hero_weaver",
	"npc_dota_hero_sand_king",
	"npc_dota_hero_wisp",
	--Channel standing still for a long time, or from a big distance
	"npc_dota_hero_crystal_maiden",
	"npc_dota_hero_phoenix",
	"npc_dota_hero_witch_doctor",
	--Can reflect
	"npc_dota_hero_spectre",
	"npc_dota_hero_nyx_assassin",
	"npc_dota_hero_viper",
	--Potentially
	"npc_dota_hero_rubick",
	"npc_dota_hero_morphling"

	--Can go invis, but has to show him first:
	--Enigma
	--SF
	--Bane
	--Pugna

    --Lol, seriously?
	--Troll axes
	--Slark dark pact
}

function U.CanDamageFromInvisWithoutRevealing(playerId)
	local hero = GetSelectedHeroName(playerId);
	return invisibleDamageDealers[hero] ~= nil;
end


function U.IsAffectedByInviser(bot)
    if
        --Items
        bot:HasModifier('modifier_item_radiance_debuff') == true
        or bot:HasModifier('modifier_item_shivas_guard_aura') == true
        or bot:HasModifier('modifier_item_assault_negative_armor_aura') == true
        or bot:HasModifier('modifier_item_assault_negative_armor') == true
        or bot:HasModifier('modifier_cloack_of_flames_debuff') == true
        or bot:HasModifier('modifier_stormcrafter_slow') == true
        --Heroes
        --Elder titan
        or bot:HasModifier('modifier_elder_titan_natural_order_aura_armor')  == true
        or bot:HasModifier('modifier_elder_titan_natural_order_aura_magic_resistance')  == true
        or bot:HasModifier('modifier_elder_titan_natural_order_armor')  == true
        or bot:HasModifier('modifier_elder_titan_natural_order_magic_resistance')  == true
        --Omniknight
        or bot:HasModifier('modifier_omniknight_degen_aura_effect') == true
        --Night stalker
        or bot:HasModifier('modifier_night_stalker_crippling_fear_aura') == true
        or bot:HasModifier('modifier_night_stalker_crippling_fear') == true
        --Sand king
        or bot:HasModifier('modifier_sandking_sand_storm_slow')  == true
        or bot:HasModifier('modifier_sandking_sand_storm_slow_aura_thinker') == true
        or bot:HasModifier('modifier_sand_king_epicenter_slow') == true
        --Tusk
        or bot:HasModifier('modifier_tusk_tag_team_aura')  == true
        or bot:HasModifier('modifier_tusk_tag_team')  == true
        or bot:HasModifier('modifier_tusk_tag_team_slow')  == true
        --Razor
        or bot:HasModifier('modifier_razor_static_link_debuff') == true
        --TODO Eye of the storm reduces armor strike by strike, but this takes time to be noticed
        --Riki
        or bot:HasModifier('modifier_riki_smoke_screen_thinker') == true
        or bot:HasModifier('modifier_riki_smoke_screen') == true
        --Shadow fiend
        or bot:HasModifier('modifier_nevermore_presence_aura') == true
        or bot:HasModifier('modifier_nevermore_presence') == true
        --Viper
        or bot:HasModifier('modifier_viper_corrosive_skin') == true
        or bot:HasModifier('modifier_viper_corrosive_skin_slow') == true
        --Death prophet
        or bot:HasModifier('modifier_death_prophet_spirit_siphon_slow') == true
        or bot:HasModifier('modifier_death_prophet_spirit_siphon') == true
        --Inovker
        or bot:HasModifier('modifier_invoker_ghost_walk_enemy') == true
        --Lich
        or bot:HasModifier('modifier_lich_frost_shield_slow') == true
        --Necro
        or bot:HasModifier('modifier_necrolyte_sadist_aura_effect') == true
        --Crystal maiden
        or bot:HasModifier('modifier_crystal_maiden_freezing_field_slow') == true
    then
        return true;
    end
        
    local playerId = bot:GetPlayerID();
    local hero = GetSelectedHeroName(playerId);

    if 
        (
            (hero == 'npc_dota_hero_pudge' and bot:GetAbilityInSlot(1):GetToggleState() == false) 
            or hero ~= 'npc_dota_hero_pudge'
        )
        and bot:HasModifier('pudge_rot') == true
    then
        return true;
    end

    if 
        hero == "npc_dota_hero_drow_ranger"
        and bot:GetAbilityInSlot(3):GetLevel() > 0
        and bot:HasModifier('modifier_drow_ranger_marksmanship') == false
    then
        return true;
    end

    return false;
end

return U;