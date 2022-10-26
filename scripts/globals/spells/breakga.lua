-----------------------------------------
-- Spell: Breakga
-- Petrifies enemies within area of effect, preventing them from acting.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    -- Pull base stats.
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    local duration = calculateDuration(30, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.PETRIFICATION
    local resist = applyResistanceEffect(caster, target, spell, params)

    TryApplyEffect(caster, target, spell, params.effect, 1, 0, duration, resist, 0.5)

    return params.effect
end
