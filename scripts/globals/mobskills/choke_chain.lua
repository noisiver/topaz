---------------------------------------------
-- Choke Chain
-- Single target Bind, Silence, Amnesia. Used only when the door is closed.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if  mob:AnimationSub() == 0 or mob:AnimationSub() == 0 then --Needs testing for proper animation sub
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)

    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.AMNESIA, 1, 0, 30)
    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 300))
    return dmg
end
