---------------------------------------------
--  Unblest Jambiya
--  Family: Qutrub
--  Description: Steals HP from targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: AoE 15'
--  Notes: Used only by certain NM's when their primary sword isn't broken.
-- Zareehkl uses when dagger is out.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 9093 then -- (Tutankhamun - Arrapago Remnants Salvage Custom)
        return 0
    end
    if mob:AnimationSub() == 2 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.0, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

    return dmg
end
