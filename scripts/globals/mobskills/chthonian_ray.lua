---------------------------------------------
-- Apocalyptic Ray
-- Only used by Mindertaur
-- Description: Inflicts doom in a wide line gaze attack.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
local typeEffect = tpz.effect.DOOM
    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(MobGazeMove(mob, target, typeEffect, 10, 3, 30))
    end

    return tpz.effect.DOOM
end