-----------------------------------
-- Area: Caedarva Mire
--  NPC: Engraved Tablet
-- !pos -719 -13 765 79
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(305)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 305 and option == 1 then
        player:setPos(763, -7, 635, 60) 
    end
end
