-----------------------------------
-- Attachment: Heat Capacitor II
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("heat_capacitor", 2)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_HEAT_CAPACITOR_II", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(tpz.effect.FIRE_MANEUVER) > 0 and automaton:getLocalVar("meditate") < VanadielTime() then
            automaton:useMobAbility(2745, automaton)
        end
    end)
    pet:setLocalVar("heat_capacitor_manuevers", 33)
end

function onUnequip(pet)
    pet:setLocalVar("heat_capacitor", 0)
    pet:removeListener("ATTACHMENT_HEAT_CAPACITOR_II")
    pet:setLocalVar("heat_capacitor_manuevers", 0)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("heat_capacitor_manuevers", 33)
    elseif maneuvers == 1 then
        pet:setLocalVar("heat_capacitor_manuevers", 66)
    elseif maneuvers == 2 then
        pet:setLocalVar("heat_capacitor_manuevers", 99)
    elseif maneuvers == 3 then
        pet:setLocalVar("heat_capacitor_manuevers", 125)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("heat_capacitor_manuevers", 33)
    elseif maneuvers == 1 then
        pet:setLocalVar("heat_capacitor_manuevers", 66)
    elseif maneuvers == 2 then
        pet:setLocalVar("heat_capacitor_manuevers", 99)
    elseif maneuvers == 3 then
        pet:setLocalVar("heat_capacitor_manuevers", 125)
    end
end
