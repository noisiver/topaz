-----------------------------------------
-- Spell: Massacre Elegy
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 240
    local power = 10000

    local pCHR = caster:getStat(tpz.mod.CHR)
    local mCHR = target:getStat(tpz.mod.CHR)
    local dCHR = pCHR - mCHR
    local params = {}
    params.diff = dCHR
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = 0
    params.effect = tpz.effect.ELEGY
    resist = applyResistanceEffect(caster, target, spell, params)

    local iBoost = caster:getMod(tpz.mod.ELEGY_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost * 100

    if caster:hasStatusEffect(tpz.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(tpz.effect.MARCATO) then
        power = power * 1.5
    end
    caster:delStatusEffectSilent(tpz.effect.MARCATO)

    duration = duration * (iBoost * 0.1 + caster:getMod(tpz.mod.SONG_DURATION_BONUS) / 100 + 1)

    if caster:hasStatusEffect(tpz.effect.TROUBADOUR) then
        duration = duration * 2
    end

    TryApplyEffect(caster, target, spell, params.effect, 1, 0, duration, resist, 0.5)

    return params.effect
end
