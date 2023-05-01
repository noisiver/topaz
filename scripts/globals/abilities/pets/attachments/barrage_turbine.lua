-----------------------------------
-- Attachment: Barrage Turbine
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------


function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_BARRAGE_TURBINE", function(automaton, target)
        local master = automaton:getMaster()

        if master and master:countEffect(tpz.effect.WIND_MANEUVER) > 0 and not automaton:hasStatusEffect(tpz.effect.BARRAGE) then
            automaton:useMobAbility(2746, automaton)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("ATTACHMENT_BARRAGE_TURBINE")
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end