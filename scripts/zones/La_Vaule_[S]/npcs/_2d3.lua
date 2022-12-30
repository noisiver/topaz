-----------------------------------
-- Area: La Vaule[S]
-- The Bloodbathed Crown BCNM Exit
-- !gotoid 17126107
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/bcnm")
-----------------------------------

function onTrigger(player, npc)
    player:startEvent(32003)
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, eventid, result, door)
    if EventFinishBCNM(player, csid, option) then
        return
    end
end