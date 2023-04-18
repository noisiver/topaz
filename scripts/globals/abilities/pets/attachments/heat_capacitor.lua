-----------------------------------
-- Attachment: Heat Capacitor
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/automaton")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("heat_capacitor", 400)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_HEAT_CAPACITOR", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(tpz.effect.FIRE_MANEUVER) > 0 and automaton:getLocalVar("meditate") < VanadielTime() then
            automaton:useMobAbility(2745, automaton)
        end
    end)
    et:setLocalVar("heat_capacitor_manuevers", 25)
end

function onUnequip(pet)
    pet:setLocalVar("heat_capacitor", -400)
    pet:removeListener("ATTACHMENT_HEAT_CAPACITOR")
    pet:setLocalVar("heat_capacitor_manuevers", 0)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("heat_capacitor_manuevers", 25)
    elseif maneuvers == 1 then
        pet:setLocalVar("heat_capacitor_manuevers", 33)
    elseif maneuvers == 2 then
        pet:setLocalVar("heat_capacitor_manuevers", 66)
    elseif maneuvers == 3 then
        pet:setLocalVar("heat_capacitor_manuevers", 99)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("heat_capacitor_manuevers", 25)
    elseif maneuvers == 1 then
        pet:setLocalVar("heat_capacitor_manuevers", 33)
    elseif maneuvers == 2 then
        pet:setLocalVar("heat_capacitor_manuevers", 66)
    elseif maneuvers == 3 then
        pet:setLocalVar("heat_capacitor_manuevers", 99)
    end
end
