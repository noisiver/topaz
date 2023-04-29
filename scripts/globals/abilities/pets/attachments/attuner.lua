-----------------------------------
-- Attachment: Attuner
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEquip(pet)
    pet:setLocalVar("attuner", 1)
    pet:setLocalVar("attunerBonus", 15)
end

function onUnequip(pet)
    pet:setLocalVar("attuner", 0)
    pet:setLocalVar("attunerBonus", 0)
end

function onManeuverGain(pet, maneuvers)
    local attunerBonus = pet:getLocalVar("attunerBonus")
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("attunerBonus", attunerBonus + 15)
        elseif maneuvers == 2 then
            pet:setLocalVar("attunerBonus", attunerBonus + 15)
        elseif maneuvers == 3 then
            pet:setLocalVar("attunerBonus", attunerBonus + 15)
        end
    end
end

function onManeuverLose(pet, maneuvers)
    local attunerBonus = pet:getLocalVar("attunerBonus")
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("attunerBonus", attunerBonus - 15)
        elseif maneuvers == 2 then
            pet:setLocalVar("attunerBonus", attunerBonus - 15)
        elseif maneuvers == 3 then
            pet:setLocalVar("attunerBonus", attunerBonus - 15)
        end
    end
end
