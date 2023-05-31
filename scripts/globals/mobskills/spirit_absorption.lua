---------------------------------------------
-- Spirit Absorption
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local basehp = skill:getParam()
    if (basehp == 0) then
        basehp = 50
    end
	local RNG = math.random(1, 2)
	if RNG == 1 then
		-- time to drain HP
        local dmgmod = 3.5
		local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
		local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)

        skill:setMsg(MobDrainMove(mob, target, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))

		return dmg
	elseif RNG == 2 and mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE+tpz.effectFlag.FOOD) then
		local dmg = 0
        local count = 1


        skill:setMsg(tpz.msg.basic.EFFECT_DRAINED)

        return count
	end
end
