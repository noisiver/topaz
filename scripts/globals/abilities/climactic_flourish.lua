-----------------------------------
-- Ability: Climactic Flourish
-- Description: Allows you to deal critical hits. Requires at least one finishing move.
-- Obtained: DNC Level 80
-- Recast Time: 00:01:30 (Flourishes III)
-- Duration: 00:01:00
-- Cost: 1-5 Finishing Move charges
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    for move = tpz.effect.FINISHING_MOVE_1, tpz.effect.FINISHING_MOVE_5 do
        player:delStatusEffect(move)
        player:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 3, 0, 60, 0, player:getMerit(tpz.merit.CLIMACTIC_FLOURISH_EFFECT))
    end
end
