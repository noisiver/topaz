-----------------------------------------
-- Spell: Water III
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
    spellParams.resistBonus = 1.0
    spellParams.V = 300
    spellParams.V0 = 300
    spellParams.V50 = 430
    spellParams.V100 = 570
    spellParams.V200 = 760
    spellParams.M = 1.5
    spellParams.M0 = 3.7
    spellParams.M50 = 2.9
    spellParams.M100 = 1.95
    spellParams.M200 = 1
    spellParams.I = 300

    return doElementalNuke(caster, spell, target, spellParams)
end
