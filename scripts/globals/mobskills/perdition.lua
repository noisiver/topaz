---------------------------------------------
-- Perdition
-- Description: Instant K.O.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or target:hasStatusEffect(tpz.effect.FEALTY) or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return 0
    end
    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    else
		target:setHP(0)
	end

    return 0
end
