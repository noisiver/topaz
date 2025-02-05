-----------------------------------
-- Attachment: Regulator
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REGULATOR", function(automaton, target)
        local master = automaton:getMaster()
        if master and master:countEffect(tpz.effect.DARK_MANEUVER) > 0 and target:hasStatusEffectByFlag(tpz.effectFlag.DISPELABLE) and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(3485)
        else
            return 0
        end
    end)
end

function onUnequip(pet)
end

function onManeuverGain(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
end
