---------------------------------------------
-- Mortal Ray
--
-- Description: Inflicts Doom upon an enemy.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mortalRayUsed = mob:getLocalVar("mortalRayUsed")
    if (mortalRayUsed > 0) then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DOOM

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.EVADES)
    else
        skill:setMsg(MobGazeMove(mob, target, typeEffect, 10, 3, 30))
    end
    if not mob:isNM() then
        mob:setLocalVar("mortalRayUsed", 1)
    end
    return typeEffect
end
