---------------------------------------------
-- Mortal Blast
--  Gaze Death
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (target:isFacing(mob)) then
		if target:hasStatusEffect(tpz.effect.BLINDNESS) then
			skill:setMsg(tpz.msg.basic.SKILL_MISS)
		else
            MobDeathMove(mob, target, skill)
        end
    else
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end
    return 0
end
