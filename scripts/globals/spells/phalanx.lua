-----------------------------------------
-- Spell: Phalanx
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local enhskill = caster:getSkillLevel(tpz.skill.ENHANCING_MAGIC) + caster:getMod(tpz.mod.ENHANCE)
    local power = 0
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 33, target:getMainLvl())

    if enhskill <= 300 then
        power = math.max(math.floor(enhskill / 10) - 2, 0) + caster:getMod(tpz.mod.PHALANX_POTENCY)
    else
        power = math.floor((enhskill - 300.5) / 28.5) + 28 + caster:getMod(tpz.mod.PHALANX_POTENCY)
    end

    -- Cap at 35
    power = math.min(power, 35)

    -- Add phalanx recieved gear mod
    power = power + target:getMod(tpz.mod.PHALANX_RECIEVED)

    if target:addStatusEffect(tpz.effect.PHALANX, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.PHALANX
end
