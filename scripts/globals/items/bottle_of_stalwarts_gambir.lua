-----------------------------------------
-- ID: 5840
-- Item: bottle_of_stalwarts_gambir
-- Item Effect: ACC 100 RACC 100 RATTP 50 ATTP 50
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = tpz.effect.ACCURACY_BOOST
    local effect2 = tpz.effect.ATTACK_BOOST
    local power = 100
    local power2 = 50
    local duration = 60

    if (target:addStatusEffect(effect, power, 0, duration)) then
        target:messagePublic(tpz.msg.basic.GAINS_EFFECT_OF_ITEM, target, effect, effect)
    else
        target:messagePublic(tpz.msg.basic.NO_EFFECT, target, effect)
    end
    target:addStatusEffect(effect2, power2, 0, duration)
end
