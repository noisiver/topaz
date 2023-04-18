-----------------------------------
-- Attachment: Tactical Processor
-- Not enough information to accurately recreate!
-- Also, not implemented, increased tendency to overload prior to 2015!
-----------------------------------
require("scripts/globals/status")
-----------------------------------
---0.2	-0.5	-0.8	-1.15
function onEquip(pet)
    pet:addMod(tpz.mod.AUTO_DECISION_DELAY, 20) -- -0.2s
end

function onUnequip(pet)
    pet:delMod(tpz.mod.AUTO_DECISION_DELAY, 20)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.AUTO_DECISION_DELAY, 30) -- -0.5s 
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.AUTO_DECISION_DELAY, 30) -- -0.7s 
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.AUTO_DECISION_DELAY, 30) -- -1.15s
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.AUTO_DECISION_DELAY, 30)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.AUTO_DECISION_DELAY, 30)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.AUTO_DECISION_DELAY, 30)
    end
end
