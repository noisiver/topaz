-----------------------------------------
-- ID: 17768
-- Item: Yoto +1
-- Additional Effect: Weakens defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 12
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.DEFENSE_DOWN, tpz.magic.ele.WIND, 0)
    local duration = math.floor(60 * resist)
   
    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.DEFENSE_BOOST)
        target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 19, 0, duration)
        return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.DEFENSE_DOWN
    end
end
