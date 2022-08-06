-----------------------------------------
-- Spell: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dMND = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))

    local duration = calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --Resist
    local params = {}
    params.diff = dMND
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.SILENCE
    local resist = applyResistanceEffect(caster, target, spell, params)
    duration = duration * resist
    duration = math.ceil(duration * tryBuildResistance(tpz.magic.buildcat.SILENCE, target))

    TryApplyEffect(caster, target, spell, params.effect, 1, 0, duration, resist, 0.5)

    return params.effect
end
