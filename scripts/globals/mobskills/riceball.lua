---------------------------------------------
--  Shogun Rice Ball
--  Description: Increases Attack, Defense, and Magic Defense
---------------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    target:addStatusEffect(tpz.effect.FOOD,0,0,1800,4278)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
