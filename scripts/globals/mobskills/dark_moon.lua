---------------------------------------------------
-- Dark Moon
-- Deals dark elemental damage to enemies within area of effect. Additional effet: Weakness
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1.5
    if mob:getPool() == 5763 then -- Marquis Sabnock
        dmgmod = 0.5
    end
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)

    if mob:getPool() == 5763 then -- Marquis Sabnock
        if target:hasStatusEffect(tpz.effect.FEALTY) then
            skill:setMsg(tpz.msg.basic.EVADES)
        else
            MobStatusEffectMove(mob, target, tpz.effect.WEAKNESS, 1, 0, 30)
        end
    end

    return dmg
end
