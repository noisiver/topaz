-----------------------------------
-- Ability: Spectral jig
-- Allows you to evade enemies by making you undetectable by sight and sound.
-- Obtained: Dancer Level 25
-- TP Required: 0
-- Recast Time: 30 seconds
-- Duration: 3 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
   return 0, 0
end

function onUseAbility(player, target, ability)
    local amount = 6
    if (player:getMainJob() == tpz.job.DNC) then
        amount = 12
    end
    local duration = 15
    local gear = player:getMod(tpz.mod.JIG_DURATION)
    player:addStatusEffectEx(tpz.effect.MEDITATE, 0, amount, 3, duration)
end
