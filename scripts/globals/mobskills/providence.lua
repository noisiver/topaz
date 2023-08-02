---------------------------------------------
-- Providence
-- Family: Poroggo
-- Description: 	Gains Haste + allows casting of Breakga, Graviga, Slowga, Bindga, and Death.
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isNM()) or mob:getPool() == 9061 then -- Poroggo_Shifu(Imperial Agent Rescue - Assault)
        return 0
    end
    return 1
end
function onMobWeaponSkill(target, mob, skill)
    local power = 2500
    local duration = 300
    local typeEffect = tpz.effect.HASTE
	mob:setLocalVar("Providence", 1)



    skill:setMsg(MobBuffMove(target, typeEffect, power, 0, duration))
    return typeEffect
end
