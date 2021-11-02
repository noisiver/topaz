-----------------------------------------
-- ID: 5267
-- Item: Shu'Meyo Salt
-- Additional Effect: Melts Snoll Tzar
-----------------------------------------
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target)
    if target:getPool() == 3684 and target:getLocalVar("salted") ~= 1 then
        return 0
    end
        return 1
end

function onItemUse(target, item)
    if target:getLocalVar("salted") ~= 1 then
        target:showText(target, ID.text.BEGIN_TO_MELT)
        target:setLocalVar("shifttime", target:getLocalVar("shifttime") + 20)
        target:setLocalVar("salted", 1)
        target:timer(7000, function(target)
            if target:isDead() then
                return
            end
            target:showText(target, ID.text.EMIT_STEAM)
        end)
        target:timer(1400, function(target)
            if target:isDead() then
                return
            end
            target:showText(target, ID.text.EMIT_STEAM)
        end)
        target:timer(21000, function(target)
            if target:isDead() then
                return
            end
            target:setLocalVar("salted", 0)
            target:showText(target, ID.text.SHAKES_SALT)
        end)
    end
end