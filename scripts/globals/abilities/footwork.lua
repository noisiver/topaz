-----------------------------------
-- Ability: Footwork
-- Makes kicks your primary mode of attack.
-- Obtained: Monk Level 65
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
   local kickDmg = 36 + player:getWeaponDmg()
   local doubleAttackRate = 5 + player:getMerit(tpz.merit.KICK_ATTACK_RATE)
   player:delStatusEffectSilent(tpz.effect.COUNTERSTANCE) -- Counterstance and Footwork don't stack
   player:addStatusEffect(tpz.effect.FOOTWORK, kickDmg, 0, 300, 0, doubleAttackRate)
end
