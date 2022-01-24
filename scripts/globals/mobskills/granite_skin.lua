---------------------------------------------
-- Granite Hide
--
-- Description: Immunity to physical attacks in front.
-- Type: Enhancing
--
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.FRONTAL_PDT) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:setMod(tpz.mod.FRONTAL_PDT, 100)

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT) -- lasted 15 mins

    return tpz.effect.PHYSICAL_SHIELD
end

