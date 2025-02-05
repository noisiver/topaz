-----------------------------------------
-- ID: 5836
-- Item: tube_of_healing_salve_ii
-- Item Effect: Instantly restores 100% of pet HP
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if not target:hasPet() then
        return tpz.msg.basic.NO_TARGET_AVAILABLE
    end
    return 0
end

function onItemUse(target)
    local pet = target:getPet()
    local totalHP = pet:getMaxHP()
    pet:addHP(totalHP)
    target:messagePublic(tpz.msg.basic.RECOVERS_HP, pet, totalHP)
end
