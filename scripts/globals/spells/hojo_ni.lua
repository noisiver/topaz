-----------------------------------------
-- Spell: Hojo:Ichi
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --Duration and Resistance calculation
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.NINJUTSU
    params.bonus = 0
    params.effect = tpz.effect.SLOW
    local power = 2000
    local resist = applyResistance(caster, target, spell, params)
    local duration =  math.ceil(180 * resist)

    TryApplyEffect(caster, target, spell, params.effect, power, 0, duration, resist, 0.5)

    return params.effect
end

