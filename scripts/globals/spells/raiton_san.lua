-----------------------------------------
-- Spell: Raiton: San
-- Deals lightning damage to an enemy and lowers its resistance against earth.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --doNinjutsuNuke(V, M, caster, spell, target, hasMultipleTargetReduction, resistBonus)
    local duration = 30 + (caster:getMerit(tpz.merit.RAITON_EFFECT) * 5) -- T1 bonus debuff duration
    local bonusAcc = 30
    local bonusMab = 0

    local params = {}

    params.dmg = 300

    params.multiplier = 1.5

    params.hasMultipleTargetReduction = false

    params.bonus =  bonusAcc

    params.mabBonus = bonusMab

    dmg = doNinjutsuNuke(caster, target, spell, params)
    handleNinjutsuDebuff(caster, target, spell, 30, duration, tpz.mod.EARTHRES)

    return dmg
end
