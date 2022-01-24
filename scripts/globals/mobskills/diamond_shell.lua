---------------------------------------------
-- Diamond Shell
-- Covers the user in icey spikes and absorbs damage. Enemies that hit it take ice damage.
-- Stoneskin portion cannot be removed with dispel.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BEHIND_PDT) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:setMod(tpz.mod.BEHIND_PDT, 100)

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT) -- lasted 15 mins

    return tpz.effect.PHYSICAL_SHIELD
end

