---------------------------------------------
-- Leeching Current
--Drains 1k HP total divided by number of targets. Ignores shadows.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local AIMode = mob:getLocalVar("AIMode")
    if mob:getPool() == 2920 then -- Nuhn
        if AIMode == 1 or mob:getHPP() > 50 then
            return 1
        end
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 1000 / skill:getTotalTargets()
    local info = MobNeedlesMagicalMove(mob, target, skill, needles, tpz.magic.ele.WATER, tpeffect)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    skill:setMsg(MobDrainMove(mob, target, skill, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.WATER))

    return dmg
end
