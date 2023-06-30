-----------------------------------
-- Ability: Ternary Flourish
-- Description: Allows you to deliver a threefold attack. Requires at least three finishing moves.
-- Obtained: DNC Level 93
-- Recast Time: 00:00:45 (Flourishes III)
-- Duration: 00:01:00
-- Cost: 3 Finishing Move charges
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)

    if player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
        player:addStatusEffect(tpz.effect.TERNARY_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.TERNARY_FLOURISH_EFFECT))
    elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
        player:addStatusEffect(tpz.effect.TERNARY_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.TERNARY_FLOURISH_EFFECT))
    elseif player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
        player:addStatusEffect(tpz.effect.TERNARY_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.TERNARY_FLOURISH_EFFECT))
    end
end
