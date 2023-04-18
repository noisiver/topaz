-----------------------------------
-- Attachment: Ice Maker
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    et:setLocalVar("ice_maker_bonus", 0)
end

function onUnequip(pet)
    pet:setLocalVar("ice_maker_bonus", 0)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("ice_maker_bonus", 0)
    elseif maneuvers == 1 then
        pet:setLocalVar("ice_maker_bonus", 20)
    elseif maneuvers == 2 then
        pet:setLocalVar("ice_maker_bonus", 40)
    elseif maneuvers == 3 then
        pet:setLocalVar("ice_maker_bonus", 60)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 0 then
        pet:setLocalVar("ice_maker_bonus", 0)
    elseif maneuvers == 1 then
        pet:setLocalVar("ice_maker_bonus", 20)
    elseif maneuvers == 2 then
        pet:setLocalVar("ice_maker_bonus", 40)
    elseif maneuvers == 3 then
        pet:setLocalVar("ice_maker_bonus", 60)
    end
end