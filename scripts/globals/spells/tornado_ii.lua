-----------------------------------------
-- Spell: Tornado II
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
    spellParams.resistBonus = caster:getMerit(tpz.merit.TORNADO_II) * 5
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
    spellParams.I = 780
    spellParams.AMIIburstBonus = caster:getMerit(tpz.merit.TORNADO_II) * 3

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster, target, spell, 30, 60, tpz.mod.ICERES)

    return doElementalNuke(caster, spell, target, spellParams)
end
