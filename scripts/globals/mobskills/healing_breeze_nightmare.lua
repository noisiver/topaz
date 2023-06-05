---------------------------------------------
-- Healing Breeze (Nightmare)
--
-- Description: Restores HP for party members within area of effect.
-- Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local hp = mob:getHPP()
    local purushamriga = mob:getPool() == 9082
    if hp < 50 and purushamriga then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
     return MobPercentHealMove(mob, skill, 0.16)
end
