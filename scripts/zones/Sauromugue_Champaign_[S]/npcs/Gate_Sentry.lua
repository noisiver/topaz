-----------------------------------
-- Area: Sauromugue_Champaign_[S]
--  NPC: Gate Sentry
-- Standard Info NPC
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:startEvent(253, 98, 1, 0, 0, 0, 0, 0, 0)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
