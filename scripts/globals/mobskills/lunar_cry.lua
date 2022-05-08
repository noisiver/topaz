---------------------------------------------------
-- Lunar Cry
-- Fenrir gives accuracy and evasion down status effects to target.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local moon = VanadielMoonPhase()
    local buffvalue = 1

    if (moon > 90) then
        buffvalue = 62
    elseif (moon > 75) then
        buffvalue = 52
    elseif (moon > 60) then
        buffvalue = 42
    elseif (moon > 40) then
        buffvalue = 32
    elseif (moon > 25) then
        buffvalue = 22
    elseif (moon > 10) then
        buffvalue = 12
    end

    target:addStatusEffect(tpz.effect.ACCURACY_DOWN, buffvalue, 0, 300)
    target:addStatusEffect(tpz.effect.EVASION_DOWN, 32-buffvalue, 0, 300)
    skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_2)
    mob:setTP(0)

    return 0
end
