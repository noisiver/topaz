-----------------------------------------
-- Spell: Flare
-- Deals fire damage to an enemy and lowers its resistance against water.
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
    spellParams.resistBonus = 0
    spellParams.V = 541
    spellParams.V0 = 600
    spellParams.V50 = 780
    spellParams.V100 = 955
    spellParams.V200 = 1230
    spellParams.M = 2
    spellParams.M0 = 3.6
    spellParams.M50 = 3.5
    spellParams.M100 = 2.75
    spellParams.M200 = 2
    spellParams.I = 626

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster, target, spell, 30, 10, tpz.mod.WATERRES)

    return doElementalNuke(caster, spell, target, spellParams)
end
