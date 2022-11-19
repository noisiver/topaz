-----------------------------------------
-- ID: 5391
-- Soldier's Drink
-- Increases the enemies damage taken by 50% for 30 seconds.
-- TODO: Test
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = tpz.effect.SOLDIERS_DRINK
    local power = 1
    local duration = 60
    local mob = target:getTarget()
    mob:addStatusEffectEx(tpz.effect.INCREASED_DAMAGE_TAKEN, tpz.effect.INCREASED_DAMAGE_TAKEN, 1, 0, 30)
end
