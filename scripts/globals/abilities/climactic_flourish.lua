-----------------------------------
-- Ability: Climactic Flourish
-- Description: Grants +5% double attack per finishing move consumed to nearby allies.
-- Obtained: DNC Level 80
-- Recast Time: 00:01:30 (Flourishes III)
-- Duration: 00:03:00
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
    if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
        target:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 5, 0, 180)
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
        target:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 10, 0, 180)
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
        target:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 15, 0, 180)
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
        target:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 20, 0, 180)
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
        player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
        player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
        target:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 25, 0, 180)
    end
end
