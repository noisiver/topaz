---------------------------------------------
--  Vile Belch
--  Description: Inflicts Silence + Plague. Ignores shadows.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeffect =  tpz.effect.SILENCE
    local duration = 300
    MobStatusEffectMove(mob, target, tpz.effect.PLAGUE, 5, 3, duration)
    MobStatusEffectMove(mob, target, typeffect, 1, 0, duration)

    return typeEffect
end
