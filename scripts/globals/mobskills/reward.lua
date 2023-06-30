---------------------------------------------
-- Restoral
-- Description: Restores HP.
---------------------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --[[
    The only calculations available on the net are for the players blue magic version,
    which does not seem to fit with retail in game observations on the mobskill version..
    So math.random() for now!
    ]]
	local target = GetMobByID(16986197)
    skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)

    return MobHealMove(mob, target, skill, 2)
end
