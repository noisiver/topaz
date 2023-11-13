-----------------------------------------
-- Spell: Protectra V
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 1800
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl())
    local meritBonus = caster:getMerit(tpz.merit.PROTECTRA_V)
    local power = 60 + meritBonus -- changed to 75 era was 220

    local typeEffect = tpz.effect.PROTECT
    if ApplyProtectShell(caster, target, typeEffect, power, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end
