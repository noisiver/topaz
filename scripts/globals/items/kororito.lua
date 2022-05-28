-----------------------------------------
-- ID: 
-- Item: Kororito
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.POISON, tpz.magic.ele.WATER, 0)
    local duration = math.floor(60 * resist)

    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.POISON, 15, 3, duration)  -- changed to 15/tick 60s dura
        return tpz.subEffect.POISON, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.POISON
    end
end
