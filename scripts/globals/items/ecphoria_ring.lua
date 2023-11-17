-----------------------------------------
-- ID: 15817
-- Item: ecphoria_ring
-- Item Effect: Removes amnesia
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if not target:hasStatusEffect(tpz.effect.AMNESIA) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE_2
    end
    return 0
end

function onItemUse(target)
    if target:hasStatusEffect(tpz.effect.AMNESIA) then
        target:delStatusEffect(tpz.effect.AMNESIA)
    end
end

