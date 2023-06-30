---------------------------------------------
--  Vile Belch
--  Description: Inflicts Silence + Plague. Ignores shadows.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local AIMode = mob:getLocalVar("AIMode")
    if mob:getPool() == 2920 and AIMode == 1 then -- Nuhn
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeffect =  tpz.effect.SILENCE
    local duration = 300
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 10, 3, duration)
    skill:setMsg(MobStatusEffectMove(mob, target, typeffect, 1, 0, duration))

    return typeffect
end
