---------------------------------------------
-- Nosferatus' Kiss
-- Steals an enemy's HP and TP. Ineffective against undead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 0.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
	
	if dmg > 300 then dmg = 300 end 
   
   if (target:getTP() > dmg) then
        mob:addTP(dmg)
        target:delTP(dmg)
    else
        dmg = target:getTP()
        mob:addTP(dmg)
        target:delTP(dmg)
    end
    if (target:getMP() > dmg) then
        mob:addMP(dmg)
        target:delMP(dmg)
    else
        dmg = target:getMP()
        mob:addMP(dmg)
        target:delMP(dmg)
    end
		
		skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))
		skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg))
        skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_TP, dmg))


    return dmg
end
