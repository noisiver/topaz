---------------------------------------------
-- Heat Capacitor
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
    automaton:addRecast(tpz.recast.ABILITY, skill:getID(), 90)
    local maneuvers = master:countEffect(tpz.effect.FIRE_MANEUVER)
    skill:setMsg(tpz.msg.basic.TP_INCREASE)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(tpz.effect.FIRE_MANEUVER)
    end


    target:addTP(automaton:getLocalVar("heat_capacitor") * maneuvers)

   return target:getTP()
end
