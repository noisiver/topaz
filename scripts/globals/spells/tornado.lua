-----------------------------------------
-- Spell: Tornado
-- Deals wind damage to an enemy and lowers its resistance against ice.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 710
    spellParams.V0 = 900
    spellParams.V50 = 1100
    spellParams.V100 = 1287
    spellParams.V200 = 1662
    spellParams.M = 2
    spellParams.M0 = 4
    spellParams.M50 = 3.74
    spellParams.M100 = 3.75
    spellParams.M200 = 3
    spellParams.I = 626

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 8.25, 0, 60)
	target:addStatusEffect(tpz.effect.EVASION_DOWN, 10, 0, 60)
    handleNinjutsuDebuff(caster, target, spell, 30, 10, tpz.mod.ICERES)

    return doElementalNuke(caster, spell, target, spellParams)
end
