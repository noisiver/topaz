-----------------------------------
-- Attachment: Truesights
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("truesights_manuevers", 5)
end

function onUnequip(pet)
    pet:setLocalVar("truesights_manuevers", 0)
end

function onManeuverGain(pet, maneuvers)
    local truesightsBonus = pet:getLocalVar("truesights_manuevers")
    if maneuvers == 1 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus + 10)
    elseif maneuvers == 2 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus + 15)
    elseif maneuvers == 3 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus + 15)
    end
end

function onManeuverLose(pet, maneuvers)
    local truesightsBonus = pet:getLocalVar("truesights_manuevers")
    if maneuvers == 1 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus - 10)
    elseif maneuvers == 2 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus - 15)
    elseif maneuvers == 3 then
        pet:setLocalVar("truesights_manuevers", truesightsBonus - 15)
    end
end
