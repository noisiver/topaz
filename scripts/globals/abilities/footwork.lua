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
   local kickDmg = 18 + player:getWeaponDmg()
   player:addStatusEffect(tpz.effect.FOOTWORK, kickDmg, 0, 300, 0, 0)
end
