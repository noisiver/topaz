-----------------------------------------
-- ID: 17698
-- Equip: Princely Sword
-- 50% of defense is added as attack.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)

    local attackBonus =  target:getLocalVar("attackBonus")

    if target:getLocalVar("attackMod") > 0 then
        local defense = math.floor(target:getStat(tpz.mod.DEF) / 2)
        target:addMod(tpz.mod.ATT, -attackBonus)
        target:setLocalVar("attackMod", 0)
        printf("defense %u", defense)
        target:setLocalVar("attackBonus", defense)
        return 0 -- So it's reset to +0 attack after unequipping Princely Sword
    end

    local defense = math.floor(target:getStat(tpz.mod.DEF) / 2)
    printf("defense %u", defense)
    target:setLocalVar("attackBonus", defense)
    printf("attackBonus %u", attackBonus)
    target:addMod(tpz.mod.ATT, attackBonus)
    target:setLocalVar("attackMod", 1)
end