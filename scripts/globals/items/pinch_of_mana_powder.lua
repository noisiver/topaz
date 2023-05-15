-----------------------------------------
-- ID: 4255
-- Item: Mana Powder
-- Item Effect: Restores 25% of maximum MP to nearby allies
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:messageBasic(tpz.msg.basic.RECOVERS_MP, 0, target:addMP((target:getMaxMP()/100)*25))
end
