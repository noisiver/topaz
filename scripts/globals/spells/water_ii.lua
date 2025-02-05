-----------------------------------------
-- Spell: Water II
-- Deals water damage to an enemy.
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
    spellParams.resistBonus = 10
    spellParams.V = 95
    spellParams.V0 = 120
    spellParams.V50 = 260
    spellParams.V100 = 355
    spellParams.V200 = 455
    spellParams.M = 1
    spellParams.M0 = 2.8
    spellParams.M50 = 1.9
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 113

    return doElementalNuke(caster, spell, target, spellParams)
end
