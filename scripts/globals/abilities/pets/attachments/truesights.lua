-----------------------------------
-- Attachment: Truesights
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("truesights", 33)
end

function onUnequip(pet)
    pet:setLocalVar("truesights", 0)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("truesights", 5)
    elseif maneuvers == 1 then
        pet:setLocalVar("truesights", 15)
    elseif maneuvers == 2 then
        pet:setLocalVar("truesights", 30)
    elseif maneuvers == 3 then
        pet:setLocalVar("truesights", 45)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("truesights", 5)
    elseif maneuvers == 1 then
        pet:setLocalVar("truesights", 15)
    elseif maneuvers == 2 then
        pet:setLocalVar("truesights", 30)
    elseif maneuvers == 3 then
        pet:setLocalVar("truesights", 45)
    end
end
