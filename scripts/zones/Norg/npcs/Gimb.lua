-----------------------------------
-- Area: Norg
--   NPC: Gimb
-- Type: Begins the "Sahagin Key Quest" but it doesn't appear in the log. See http://wiki.ffxiclopedia.org/wiki/Sahagin_Key_Quest
-- !pos -4.975 -1.975 -44.039 252
--
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)


    if (player:getCharVar("ChasingDreams") == 9) then
         player:startEvent(211)
    else
        player:startEvent(69)
        player:setCharVar("SahaginKeyProgress", 1)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
     if (csid == 211) then
        player:setCharVar("ChasingDreams", 10)
        player:delKeyItem(tpz.ki.STOREROOM_KEY)
     end
end
