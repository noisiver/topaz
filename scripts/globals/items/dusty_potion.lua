-----------------------------------------
-- ID: 5431
-- Item: Dusty Potion
-- Item Effect: Instantly restores 300 HP
-----------------------------------------
require("scripts/globals/msg")

function onItemCheck(target)
    local result = 0
    local mHP = target:getMaxHP()
    local cHP = target:getHP()

    if mHP == cHP then
        result = 56 -- Does not let player use item if their hp is full
    end

    return result
end

function onItemUse(target, item)
    target:addHP(750)
    target:messageBasic(tpz.msg.basic.RECOVERS_HP, target, item:getParam())
end
