-----------------------------------------
-- ID: 5839
-- Item: bottle_of_stalwarts_tonic
-- Item Effect: ACC 50 RACC 50 RATTP 25 ATTP 25
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = tpz.effect.ACCURACY_BOOST
    local effect2 = tpz.effect.ATTACK_BOOST
    local power = 50
    local power2 = 25
    local duration = 60

    if (target:addStatusEffect(effect, power, 0, duration)) then
        target:messagePublic(tpz.msg.basic.GAINS_EFFECT_OF_ITEM, target, effect, effect)
    else
        target:messagePublic(tpz.msg.basic.NO_EFFECT, target, effect)
    end
    target:addStatusEffect(effect2, power2, 0, duration)
end
