-----------------------------------------
-- Spell: Protectra II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local power = 25 -- changed to 75 era was 40
    local duration = 1800
    duration = calculateDurationForLvl(duration, 27, target:getMainLvl())

    local typeEffect = tpz.effect.PROTECT
    if ApplyProtectShell(caster, target, typeEffect, power, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end
