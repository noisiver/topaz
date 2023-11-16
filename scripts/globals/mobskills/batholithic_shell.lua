---------------------------------------------
-- Batholithic Shell	
-- Gains Blaze Spikes, Stoneskin, Haste, Magic Attack Bonus, and Attack Bonus.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, tpz.effect.BLAZE_SPIKES, 25, 0, 60)
    MobBuffMove(mob, tpz.effect.STONESKIN, 500, 0, 60)
    MobBuffMove(mob, tpz.effect.HASTE, 5050, 0, 60)
    MobBuffMove(mob, tpz.effect.MAGIC_ATK_BOOST, 25, 0, 60)
    skill:setMsg(MobBuffMove(mob, tpz.effect.ATTACK_BOOST, 500, 0, 60)) 
    return tpz.effect.ATTACK_BOOST
end
