-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Engraved Tablet
-- !pos 318 -15 -581 61
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(13)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 13 and option == 1 then
        player:setPos(320, -14, -377, 180) 
    end
end
