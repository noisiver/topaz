-----------------------------------------
-- ID: 19210
-- Item: Pinch Of Stygian Ash
-- Additional Effect: Stops Dark Ixion from running away
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    if (target:getPool() == 915) then -- Dark Ixion
        target:setLocalVar("Ashed", 1)
    end
    return 0, 0, 0
end
