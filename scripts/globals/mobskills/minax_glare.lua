---------------------------------------------
-- Eternal Damnation
-- Description: Inflicts Doom upon an enemy.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobGazeMove(mob, target, tpz.effect.DEFENSE_DOWN, 75, 0, 30)
    skill:setMsg(MobGazeMove(mob, target, tpz.effect.TERROR, 1, 0, 30))

    return tpz.effect.DOOM
end
