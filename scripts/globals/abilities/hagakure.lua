-----------------------------------
-- Ability: Hagakure
-- Grants "Save TP" effect and a TP bonus to your next weapon skill.
-- Obtained: Samurai Level 95
-- Recast Time: 3:00
-- Duration: 1:00 or Next Weaponskill
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local Runes = player:getLocalVar("LuxRunes")
    if Runes == 0 then
        return tpz.msg.basic.CANNOT_PERFORM_ACTION, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local Runes = player:getLocalVar("LuxRunes")
    local power = Runes * 50
    local duration = Runes * 10
    player:delStatusEffectSilent(tpz.effect.LUX)
    player:delStatusEffectSilent(tpz.effect.LUX)
    player:delStatusEffectSilent(tpz.effect.LUX)
    player:setLocalVar("LuxRunes", 0)
    player:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, duration, tpz.effect.REGEN, power, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
end

