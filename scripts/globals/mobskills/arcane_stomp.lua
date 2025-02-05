---------------------------------------------
-- Arcane Stomp
--
-- Description: Stomps the ground to apply elemental absorption.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: AoE surrounding Gurfurlur, affects all mobs.
-- Notes: Only used by Gurfurlur the Menacing. This results in all elemental damage (from spells or weaponskills) healing him. Aspir still works normally.  Lasts approximately 5 minutes, cannot be dispelled.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    MobBuffMove(mob, tpz.effect.MAGIC_SHIELD, 2, 0, 300)
    skill:setMsg(tpz.msg.basic.NONE)

    return 0
end
