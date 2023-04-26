-----------------------------------------
-- ID: 15507
-- Item: Purgatory Collar
-- Item Effect: Refresh +2
-----------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if target:hasStatusEffect(tpz.effect.REFRESH) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    end
    return 0
end

function onItemUse(target)
    if (target:addStatusEffect(tpz.effect.REFRESH, 2, 0, 150)) then
        target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.REFRESH)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
