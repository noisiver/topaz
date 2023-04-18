-----------------------------------
-- Attachment: Attuner
-----------------------------------
require("scripts/globals/status")
-----------------------------------
--TODO: Should only work against enemies higher level than you 15/30/45/60% armor ignore
function onEquip(pet)
    pet:setLocalVar("attuner", 1)
    pet:setLocalVar("attunerBonus", 15)
end

function onUnequip(pet)
    pet:setLocalVar("attuner", 0)
    pet:setLocalVar("attunerBonus", 0)
end

function onManeuverGain(pet, maneuvers)
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("attunerBonus", 30)
        elseif maneuvers == 2 then
            pet:setLocalVar("attunerBonus", 45)
        elseif maneuvers == 3 then
            pet:setLocalVar("attunerBonus", 60)
        end
    end
end

function onManeuverLose(pet, maneuvers)
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("attunerBonus", 30)
        elseif maneuvers == 2 then
            pet:setLocalVar("attunerBonus", 45)
        elseif maneuvers == 3 then
            pet:setLocalVar("attunerBonus", 60)
        end
    end
end
