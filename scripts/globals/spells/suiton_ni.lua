-----------------------------------------
-- Spell: Suiton: Ni
-- Deals water damage to an enemy and lowers its resistance against lightning.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --doNinjutsuNuke(V, M, caster, spell, target, hasMultipleTargetReduction, resistBonus)
    local duration = 30 + caster:getMerit(tpz.merit.SUITON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0
    local bonusMab = caster:getMerit(tpz.merit.SUITON_EFFECT) -- T1 mag atk

    local params = {}

    params.dmg = 69

    params.multiplier = 1

    params.hasMultipleTargetReduction = false

    params.resistBonus = bonusAcc

    params.mabBonus = bonusMab

    dmg = doNinjutsuNuke(caster, target, spell, params)
    handleNinjutsuDebuff(caster, target, spell, 30, duration, tpz.mod.THUNDERRES)

    return dmg
end
