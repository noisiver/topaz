-----------------------------------------
-- Spell: Reraise 2
-----------------------------------------

require("scripts/globals/status")

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --duration = 1800
    target:delStatusEffectSilent(tpz.effect.RERAISE)
    target:addStatusEffect(tpz.effect.RERAISE, 2, 0, 3600) --reraise 2, 60min duration

    return tpz.effect.RERAISE
end
