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
		-- time to drain HP. 50-100
		local power =  100
		local dmg = MobFinalAdjustments(power, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)

		skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

		return dmg
	end
	elseif RNG == 2 then
		local effect1 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE+tpz.effectFlag.FOOD)
		local dmg = 0

		if (effect1 ~= 0) then
			local count = 1


        skill:setMsg(tpz.msg.basic.EFFECT_DRAINED)

        return count
	end
end
