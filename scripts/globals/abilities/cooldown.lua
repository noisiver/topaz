-----------------------------------
-- Ability: Cooldown
-- Description: Reduces the strain on your automaton.
-- Obtained: PUP Level 95
-- Recast Time: 00:05:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not player:getPet() then
        -- TODO: Add check to verify this is an automaton
        return tpz.msg.basic.REQUIRES_A_PET, 0
    end
    return 0, 0
end

function onUseAbility(player, target, ability)
    -- TODO: reduceBurden not coded
    --local jpValue = player:getJobPointLevel(tpz.jp.COOLDOWN_EFFECT)

    --player:reduceBurden(50, jpValue)
    player:addStatusEffect(tpz.effect.COOLDOWN, 18, 1, 1)
end
