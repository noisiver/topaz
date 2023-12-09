---------------------------------------------
-- Carcharian Verve	
-- Gains Magic Attack Bonus, and Attack Bonus.
-- Notes: Fully dispels all negative effects
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobSelfDispelMove(mob, skill)
    MobBuffMove(mob, tpz.effect.MAGIC_ATK_BOOST, 25, 0, 60)
    skill:setMsg(MobBuffMove(mob, tpz.effect.ATTACK_BOOST, 50, 0, 60)) 
    return tpz.effect.ATTACK_BOOST
end
