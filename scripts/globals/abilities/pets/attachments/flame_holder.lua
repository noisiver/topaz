-----------------------------------
-- Attachment: Flame Holder
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onEquip(pet)
    pet:setLocalVar("flameHolder", 1)
    pet:setLocalVar("flameHolderBonus", 0)
end

function onUnequip(pet)
    pet:setLocalVar("flameHolder", 0)
    pet:setLocalVar("flameHolderBonus", 0)
end

function onManeuverGain(pet, maneuvers)
    local flameHolderBonus = pet:getLocalVar("flameHolderBonus")
    if pet:getLocalVar("flameHolder") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus + 25)
        elseif maneuvers == 2 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus + 25)
        elseif maneuvers == 3 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus + 25)
        end
    end
end

function onManeuverLose(pet, maneuvers)
    local flameHolderBonus = pet:getLocalVar("flameHolderBonus")
    if pet:getLocalVar("flameHolder") > 0 then
        if maneuvers == 1 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus - 25)
        elseif maneuvers == 2 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus - 25)
        elseif maneuvers == 3 then
            pet:setLocalVar("flameHolderBonus", flameHolderBonus - 25)
        end
    end
end
