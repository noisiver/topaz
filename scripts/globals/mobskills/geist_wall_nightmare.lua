---------------------------------------------
-- Geist Wall (Nightmare)
--
-- Description: Dispels up to three effects from targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' AoE
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local effect    = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)
    local effect2   = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)
    local effect3   = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)
    local num = 0

    if (effect ~= tpz.effect.NONE) then
        num = num + 1
    end

    if (effect2 ~= tpz.effect.NONE) then
        num = num + 1
    end

    if (effect3 ~= tpz.effect.NONE) then
        num = num + 1
    end

    if (num == 0) then
        skill:setMsg(tpz.msg.basic.EVADES) -- no effect
    else
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
    end

    return num
end
