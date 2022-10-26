-----------------------------------------
--   Spell: Poison
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    local skill = caster:getSkillLevel(tpz.skill.ENFEEBLING_MAGIC)
    local power = math.max(skill / 6, 1)       -- changed from 25
    if skill > 400 then
        power = math.min((skill - 225) / 5, 55) -- Cap is 55 hp/tick
    end
    if caster:isMob() then -- Don't let this scale out of control from mobs
        power = math.max(skill / 25, 1)
        if skill > 400 then
            power = math.min((skill - 225) / 5, 55) -- Cap is 55 hp/tick
        end
    end
    power = calculatePotency(power, spell:getSkillType(), caster, target)

    local duration = 90

    local params = {}
    params.diff = dINT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.POISON
    local resist = applyResistanceEffect(caster, target, spell, params)

    TryApplyEffect(caster, target, spell, params.effect, power, 3, duration, resist, 0.5)

    return params.effect
end
