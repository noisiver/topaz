-----------------------------------
-- Ability: Berserk
-- Enhances attacks but weakens defense.
-- Obtained: Warrior Level 15
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 25 + player:getMod(tpz.mod.BERSERK_EFFECT)
    local duration = 180 + player:getMod(tpz.mod.BERSERK_DURATION)
    player:addStatusEffect(tpz.effect.BERSERK, power, 0, duration, 0, power, 0)

    return tpz.effect.BERSERK
end
