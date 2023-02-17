-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: _2re (Handle)
-- Notes: Opens F1 trap door from behind
-- !gotoid 17183517
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    local brassDoor = GetNPCByID(npc:getID() - 4)

    if player:getZPos() > -11.9 and npc:getAnimation() == tpz.anim.CLOSE_DOOR and brassDoor:getAnimation() == tpz.anim.CLOSE_DOOR then
        npc:openDoor(6.5)
        player:timer(2000, function(player)
            brassDoor:openDoor(4.5)
        end)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
