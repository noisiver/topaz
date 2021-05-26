---------------------------------------------
-- Infernal Bulwark
-- 	Grants the enemy Haste, Stoneskin, Attack Boost, Defense Boost, Magic Attack Bonus, and Magic Defense Bonus.
-- Notes: Stoneskin is undispellable.
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
    MobBuffMove(mob, tpz.effect.HASTE, 3520, 0, 60)
    MobBuffMove(mob, tpz.effect.MAGIC_ATK_BOOST, 24, 0, 60)
    MobBuffMove(mob, tpz.effect.MAGIC_DEF_BOOST, 24, 0, 60)
    MobBuffMove(mob, tpz.effect.ATTACK_BOOST, 33, 0, 60)
    MobBuffMove(mob, tpz.effect.DEFENSE_BOOST, 33, 0, 60)
    local effect1 = mob:getStatusEffect(typeEffectOne)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 2000, 0, 300))

    return typeEffectOne
end
