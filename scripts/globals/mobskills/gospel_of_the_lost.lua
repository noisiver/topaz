---------------------------------------------
-- Gospel_of_the_Lost
--
-- Description: Self-heal (~1000 HP) and erase.
-- Type: Healing
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Accompanied by text
-- "Bask in my glory..."
-- "Mine existence...stretches into infinity..."
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Lets not heal if we haven't taken any damage..
    if (mob:getHPP() == 100) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:eraseStatusEffect()
     return MobHealMove(mob, target, skill, 1)
end
