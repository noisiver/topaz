-----------------------------------
-- Ability: Convergence
-- Increases the power of your next magical Blue Magic spell. Limits area of effect to single target.
-- Obtained: Blue Mage(Merit)
-- Recast Time: 10:00
-- Duration: 1 Spell or 60 seconds, whichever occurs first.
-- Maximum of +25 Magic Accuracy and +25% Magic damage.
-- +35% Magic damage with the Relic Armor augment
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
local power =  (player:getMerit(tpz.merit.CONVERGENCE) * 5) 
    player:addStatusEffect(tpz.effect.CONVERGENCE, power, 0, 60)
end
