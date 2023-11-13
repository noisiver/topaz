-----------------------------------------
-- Spell: Shellra V
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local meritBonus = caster:getMerit(tpz.merit.SHELLRA_V)
    local power = 24 + meritBonus -- Currently 70/70 5/5
	-- 24 at 0 merits
	--62/256 = 24.218% ～ 70/256 = 27.343% *
	-- 2/256 per merit

    local duration = 1800
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl())

    local typeEffect = tpz.effect.SHELL
    if (ApplyProtectShell(caster, target, typeEffect, power, duration)) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end
    return typeEffect
end
