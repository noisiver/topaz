-----------------------------------
-- Ability: Manawell
-- Description: Restores your MP over 9 seconds. Cannot perform actions during the duration.
-- Obtained: BLM Level 40
-- Recast Time: 00:08:00 
-- Duration: 0:00:08
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    if not player:hasStatusEffect(tpz.effect.WEIGHT) then
        player:addStatusEffect(tpz.effect.WEIGHT, 95, 0, 30)
    end
    if not player:hasStatusEffect(tpz.effect.SILENCE) and not player:hasStatusEffect(tpz.effect.MUTE) then
        player:addStatusEffect(tpz.effect.MUTE, 1, 0, 30)
    end
    if not player:hasStatusEffect(tpz.effect.AMNESIA) then
        player:addStatusEffect(tpz.effect.AMNESIA, 1, 0, 30)
    end
    if not player:hasStatusEffect(tpz.effect.MUDDLE) then
        player:addStatusEffect(tpz.effect.MUDDLE, 1, 0, 30)
    end
    player:addStatusEffect(tpz.effect.MANAWELL, 1, 0, 30)
    local effect = player:getStatusEffect(tpz.effect.WEIGHT)
    local effectTwo = player:getStatusEffect(tpz.effect.AMNESIA)
    effect:unsetFlag(tpz.effectFlag.WALTZABLE)
    effectTwo:unsetFlag(tpz.effectFlag.WALTZABLE)
end
