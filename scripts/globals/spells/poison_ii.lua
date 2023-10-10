-----------------------------------------
-- Spell: Poison II
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
    local power = math.max(skill / 10, 4)       -- changed from 20
    if skill > 400 then
        power = math.floor(skill * 49 / 183 - 55) -- No cap can be reached yet
    end
    if caster:isMob() then -- Don't let this scale out of control from mobs
        power = math.max(skill / 20, 4)
        if skill > 400 then
            power = math.floor(skill * 49 / 183 - 55) -- No cap can be reached yet
        end
    end
    power = calculatePotency(power, spell:getSkillType(), caster, target)

    local duration = 120
    local tier = 2
    local params = {}
    params.diff = dINT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 30
    params.effect = tpz.effect.POISON
    local resist = applyResistanceEffect(caster, target, spell, params)

    TryApplyEffect(caster, target, spell, params.effect, power, 3, duration, resist, 0.5, tier)

    return params.effect
end
