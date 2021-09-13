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
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local SSpower = 1000
    local power = 0
	target:setMod(tpz.mod.RAMPART_STONESKIN, SSpower)
    skill:setMsg(MobBuffMove(mob, tpz.effect.STONESKIN, power, 0, 300))

    return tpz.effect.STONESKIN
end
