---------------------------------------------------
-- Ruinous Omen
-- Deals dark elemental damage to enemies within area of effect.
-- Either deals 75%, 50% or 25% of targets current HP in damage.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local rng = math.random(1, 3)
    local hp = target:getHP() 
    if rng == 1 then
        dmg = math.floor(hp * 0.75) 
    elseif rng == 2 then
        dmg = math.floor(hp * 0.50) 
    elseif rng == 3 then
        dmg = math.floor(hp * 0.25) 
    end
    local dmg = MobFinalAdjustments(dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    return dmg
end
