-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Cermet Portal (Security Gate)
-- !pos -242 0 460
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getXPos() < -240 then
        player:messageSpecial(ID.text.DOES_NOT_RESPOND)
        return 1
    end

    return -1
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end