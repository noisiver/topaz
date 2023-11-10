---------------------------------------------
-- Dispelling Wind
--
-- Description: Dispels two effects from targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
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
    local dis1 = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)
    local dis2 = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)


    if (dis1 ~= tpz.effect.NONE and dis2 ~= tpz.effect.NONE) then
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 2
    elseif (dis1 ~= tpz.effect.NONE or dis2 ~= tpz.effect.NONE) then
        -- dispeled only one
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 1
    else
        skill:setMsg(tpz.msg.basic.SKILL_MISS) -- no effect
    end

    return 0
end
