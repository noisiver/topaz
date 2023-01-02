-----------------------------------
-- Area:  Castle Oztroja [S]
-- NPC:   _2rp (Handle)
-- Notes: Opens door _2r1
-- !gotoid 17183541
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    local brassDoor = GetNPCByID(npc:getID() - 1)

    if player:getXPos() < -186 and npc:getAnimation() == tpz.anim.CLOSE_DOOR and brassDoor:getAnimation() == tpz.anim.CLOSE_DOOR then
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
