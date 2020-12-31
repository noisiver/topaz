-----------------------------------
-- Ability: Innin
-- Reduces enmity and impairs evasion. Grants a bonus to accuracy, critical hit rate, and ninjutsu damage when striking target from behind.
-- Obtained: Ninja Level 40
-- Recast Time: 3:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    target:delStatusEffect(tpz.effect.INNIN)
    target:delStatusEffect(tpz.effect.YONIN)
   -- target:addStatusEffect(tpz.effect.INNIN, 30, 15, 300, 0, 20)
    target:addStatusEffect(tpz.effect.INNIN, math.floor(player:getMainLvl() / 4) + 2, 15, 300, 0, math.floor(player:getMainLvl() / 2) + 3) -- 30(get power), 15(MAB), 300(duration), 0, 20(get sub power)
end
