-----------------------------------------
-- ID: 15170
-- Item: Spartan Hoplon
-- Item Effect: Phalanx(-20)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local power = 20

    -- Add phalanx recieved gear mod
    power = power + target:getMod(tpz.mod.PHALANX_RECIEVED)

    if (target:addStatusEffect(tpz.effect.PHALANX, power, 0, 1800)) then
        target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.PHALANX)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
