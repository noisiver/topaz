---------------------------------------------
-- Provoke
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 30)
    target:addEnmity(automaton, 1, 1800)
    target:updateClaim(automaton)
    skill:setMsg(tpz.msg.basic.USES)
    return 0
end
