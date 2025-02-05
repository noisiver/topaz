---------------------------------------------
-- Light of Penance
--
-- Description: Reduces an enemy's TP. Additional effect: Blindness and "Bind".
-- Type: Magical (Light)
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
    local targetTP = target:getTP()
    target:setTP(0)

    MobGazeMove(mob, target, tpz.effect.BIND, 1, 0, 30)
    MobGazeMove(mob, target, tpz.effect.BLINDNESS, 100, 0, 300)

    skill:setMsg(tpz.msg.basic.TP_REDUCED)

    return targetTP
end
