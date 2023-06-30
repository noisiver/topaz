---------------------------------------------
-- Wild Carrot
--
-- Description: Restores HP.
-- Long cast time. Only used by Nimble Nelson.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local hp = mob:getHPP()
    local nimbleNelson = mob:getPool() == 9079
    if hp < 50 and nimbleNelson then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
     return MobPercentHealMove(mob, target, skill, 0.10)
end
