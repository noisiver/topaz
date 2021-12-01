-- Zone: Mine_Shaft_2716 (13)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
local ID = require("scripts/zones/Mine_Shaft_2716/IDs")
-----------------------------------

--[[..............................................................................................
    moblins can call bugbby to the middle of the bcnm
    ..............................................................................................]]
function recallBugbby(mob, target)
    if target then
        local bugbby = GetMobByID(ID.mob.BUGBBY[1])

        if bugbby ~= nil then
            local previousTarget = bugbby:getTarget()

            bugbby:showText(bugbby, ID.text.BUGBBY_OFFSET)
            if previousTarget ~= nil then
                bugbby:resetEnmity(previousTarget)
            end
            bugbby:updateEnmity(target)
            bugbby:setTP(3000)
        end
    end
end
