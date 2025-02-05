-----------------------------------------
-- ID:          5842
-- Item:        bottle_of_ascetics_gambir
-- Item Effect: MATK/MACC 50
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local effect = tpz.effect.MAGIC_ATK_BOOST
    local effect2 = tpz.effect.INTENSION
    local power = 50
    local duration = 300

    if (target:addStatusEffect(effect, power, 0, duration)) then
        target:messagePublic(tpz.msg.basic.GAINS_EFFECT_OF_ITEM, target, effect, effect)
    else
        target:messagePublic(tpz.msg.basic.NO_EFFECT, target, effect)
    end
    target:addStatusEffect(effect2, power, 0, duration)
end

