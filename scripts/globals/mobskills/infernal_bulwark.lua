---------------------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage.
-- Stoneskin portion cannot be removed with dispel.
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
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1000, 0, 300))
    MobBuffMove(mob, tpaz.effect.HASTE, 60, 0, 180)
    MobBuffMove(mob, tpaz.effect.MAGIC_ATTACK_BOOST, 60, 0, 180)
    MobBuffMove(mob, tpaz.effect.MAGIC_DEFENSE, 60, 0, 180)
    MobBuffMove(mob, tpaz.effect.ATTACK_BOOST, 60, 0, 180)
    MobBuffMove(mob, tpaz.effect.DEFENSE_BOOST, 60, 0, 180)

    return typeEffectOne
end
