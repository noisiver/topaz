-----------------------------------
-- Ability: Striking Flourish
-- Description: Allows you to deliver a twofold attack. Requires at least two finishing moves.
-- Obtained: DNC Level 89
-- Recast Time: 00:00:30 (Flourishes III)
-- Duration: 00:01:00
-- Cost: 2 Finishing Move charges
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
        player:addStatusEffect(tpz.effect.STRIKING_FLOURISH, 2, 0, 60, 0, player:getMerit(tpz.merit.STRIKING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
        player:addStatusEffect(tpz.effect.STRIKING_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.STRIKING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
        player:addStatusEffect(tpz.effect.STRIKING_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.STRIKING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
        player:addStatusEffect(tpz.effect.STRIKING_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.STRIKING_FLOURISH_EFFECT))
    end
end
