---------------------------------------------
-- Hex Palm
-- Family: Qutrub
-- Description: Steals HP from targets in front.
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Front cone
-- Notes: Used only when wielding no weapon.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() == 1 or mob:AnimationSub() == 3) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = math.floor(mob:getMainLvl() * 2)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    skill:setMsg(MobDrainMove(mob, target, skill, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))

    return dmg
end
