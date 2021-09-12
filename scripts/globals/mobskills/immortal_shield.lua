---------------------------------------------
-- Immortal Shield
--
-- Description: Magic Shield effect like Rampart. Note that enfeebling spells and songs still land.
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 1000 
    skill:setMsg(MobBuffMove(mob, tpz.effect.RAMPART_STONESKIN, power, 0, 300))
    return tpz.effect.RAMPART_STONESKIN
end
