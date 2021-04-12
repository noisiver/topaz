---------------------------------------------
-- Infernal Bulwark
-- 	Grants the enemy Haste, Stoneskin, Attack Boost, Defense Boost, Magic Attack Bonus, and Magic Defense Bonus.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.STONESKIN
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 350, 0, 60))
    MobBuffMove(mob, tpz.effect.HASTE, 3520, 0, 60)
    MobBuffMove(mob, tpz.effect.MAGIC_ATK_BOOST, 24, 0, 60)
    MobBuffMove(mob, tpz.effect.MAGIC_DEF_BOOST, 24, 0, 60)
    MobBuffMove(mob, tpz.effect.ATTACK_BOOST, 33, 0, 60)
    MobBuffMove(mob, tpz.effect.DEFENSE_BOOST, 33, 0, 60)

    return typeEffectOne
end
