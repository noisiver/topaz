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
    local Balpah = mob:getID() == 17588799
    if Balpah then
        skill:setAnimation(432)
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --[[
    The only calculations available on the net are for the players blue magic version,
    which does not seem to fit with retail in game observations on the mobskill version..
    So math.random() for now!
    ]]
    local target = GetMobByID(mob:getID() +1)
    local Percipient_Zoraal_Ja = mob:getID() == 16986198
    if Percipient_Zoraal_Ja then
	    target = GetMobByID(16986197)
    end

    skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)

    return MobHealMove(mob, target, skill, 10)
end
