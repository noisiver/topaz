---------------------------------------------
-- Nocturnal Servitude 
-- Description: Conal gaze charm.
-- Notes: Medium charge up time.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()

    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
		skill:setMsg(MobGazeMove(mob, target, tpz.effect.CHARM, 1, 0, 60))
    end

    return tpz.effect.CHARM
end
