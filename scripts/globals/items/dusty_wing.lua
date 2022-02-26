-----------------------------------------
-- ID: 5440
-- Dusty Wing
-- Increases TP of the user by 300
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:addTP(3000)
end
