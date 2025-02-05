---------------------------------------------
-- Immortal Mind
-- Enhances magical attack and magical defense.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAGIC_ATK_BOOST
    local typeEffect2 = tpz.effect.MAGIC_DEF_BOOST
    local mabTotal = mob:getStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
    local mdbTotal = mob:getStatusEffect(tpz.effect.MAGIC_DEF_BOOST)

    if (mob:getStatusEffect(tpz.effect.MAGIC_ATK_BOOST) ~= nil) then -- mag atk bonus stacking
        mabTotal = mabTotal:getPower() + 25
    else
        mabTotal = 25
    end
    if (mob:getStatusEffect(tpz.effect.MAGIC_DEF_BOOST) ~= nil) then -- mag def bonus stacking
        mdbTotal = mdbTotal:getPower() + 25
    else
        mdbTotal = 25
    end
    -- print(mabTotal)
    -- print(mdbTotal)

    skill:setMsg(MobBuffMove(mob, typeEffect1, mabTotal, 0, 300))
    MobBuffMove(mob, typeEffect2, mdbTotal, 0, 300)

    return typeEffect1
end
