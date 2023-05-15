-----------------------------------------
-- ID: 5833
-- Item: Mana Mist
-- Item Effect: Restores 300 MP to nearby allies
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:messageBasic(tpz.msg.basic.RECOVERS_MP, 0, target:addMP(300*ITEM_POWER))
end
