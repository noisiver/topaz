---------------------------------------------
-- Goblin Dice
--
-- Description: Stun
-- Type: Physical (Blunt)
--
--
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
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
    end

    return num
end
