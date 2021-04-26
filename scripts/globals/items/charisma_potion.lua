-----------------------------------------
--  ID: 4211
--  Item: Charisma Potion
--  Charisma 20
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.CHR_BOOST, 20, 0, 30)
    target:addStatusEffect(tpz.effect.INTENSION, 30, 0, 30)
    --target:addStatusEffect(tpz.effect.MEDICINE, 0, 0, 900)
end
