-----------------------------------------
-- ID: 5412
-- scapegoat
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local power = 1
    local duration = 1800

    if target:hasStatusEffect(tpz.effect.RERAISE) then
        local effect = target:getStatusEffect(tpz.effect.RERAISE)
        local oPower = effect:getPower()

        if oPower > power then
            target:messageBasic(tpz.msg.basic.NO_EFFECT)
        else
            target:delStatusEffectSilent(tpz.effect.RERAISE)
            target:addStatusEffect(tpz.effect.RERAISE, power, 0, duration)
        end
    else
        target:addStatusEffect(tpz.effect.RERAISE, power, 0, duration)
    end
end
