-----------------------------------------
-- ID: 18124
-- Item: Thalassocrat +1
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.ICE, 0) <= 0.5) then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.EVASION_BOOST)
        target:addStatusEffect(tpz.effect.EVASION_DOWN, 25, 0, 30)
        return tpz.subEffect.EVASION_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.EVASION_DOWN
    end
end
