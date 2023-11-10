-----------------------------------------
-- ID: 4130
-- Item: Ether +2
-- Item Effect: Restores 60 MP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:getMP() == target:getMaxMP()) then
        return tpz.msg.basic.ITEM_UNABLE_TO_USE
    elseif (target:hasStatusEffect(tpz.effect.MEDICINE)) then
        return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target, item)
    target:messageBasic(tpz.msg.basic.RECOVERS_MP, 0, target:addMP(item:getParam()*ITEM_POWER))
end
