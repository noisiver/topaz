-----------------------------------------
-- Spell: Aisha: Ichi
-- 20 MEVA down
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.NINJUTSU
    params.bonus = 30
    params.effect = tpz.effect.MAGIC_EVASION_DOWN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local power = 20
    local duration =  math.ceil(180 * resist)

    TryApplyEffect(caster, target, spell, params.effect, power, 0, duration, resist, 0.5)

    return params.effect
end
