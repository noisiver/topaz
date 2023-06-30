-----------------------------------
-- Attachment: Ice Maker
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:setLocalVar("ice_maker_bonus", 0)
end

function onUnequip(pet)
    pet:setLocalVar("ice_maker_bonus", 0)
end

function onManeuverGain(pet, maneuvers)
    local iceMakerBonus = pet:getLocalVar("ice_maker_bonus") 
    if maneuvers == 1 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus + 20)
    elseif maneuvers == 2 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus + 20)
    elseif maneuvers == 3 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus + 20)
    end
end

function onManeuverLose(pet, maneuvers)
    local iceMakerBonus = pet:getLocalVar("ice_maker_bonus") 
    if maneuvers == 1 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus - 20)
    elseif maneuvers == 2 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus - 20)
    elseif maneuvers == 3 then
        pet:setLocalVar("ice_maker_bonus", iceMakerBonus - 20)
    end
end