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
    local tier = automaton:getLocalVar("heat_capacitor")
    local tp = 0
    if (tier == 1) then
        if (maneuvers == 1) then
            tp = 200
        elseif (maneuvers == 2) then
            tp = 500
        elseif (maneuvers == 3) then
            tp = 800
        end
    elseif (tier == 2) then
        if (maneuvers == 1) then
            tp = 600
        elseif (maneuvers == 2) then
            tp = 1200
        elseif (maneuvers == 3) then
            tp = 1800
        end
    end
    skill:setMsg(tpz.msg.basic.TP_INCREASE)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(tpz.effect.FIRE_MANEUVER)
    end


    target:addTP(tp)

   return target:getTP()
end
