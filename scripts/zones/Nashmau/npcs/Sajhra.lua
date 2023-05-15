-----------------------------------
-- Area: Nashmau
--  NPC: Sajhra
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCharVar("PuppetmasterBluesProgress") == 6 then
        player:startEvent(291)
    else
        player:startEvent(220)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 291 then
        player:setCharVar("PuppetmasterBluesProgress", 7)
    end
end