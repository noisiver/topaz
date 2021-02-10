-----------------------------------
-- Area: Rabao
--  NPC: Zoriboh
-- Standard Info NPC
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("ChasingDreams") == 1) then
        player:startEvent(119)
    elseif (player:getCharVar("ChasingDreams") == 2) then
        player:startEvent(120)
    elseif (player:getCharVar("ChasingDreams") == 14) then
        player:startEvent(121)
    else
        player:startEvent(127)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 119 then
        player:addQuest(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)
        player:setCharVar("ChasingDreams", 2)
    elseif
        csid == 121 and
        npcUtil.completeQuest(player, OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS, {
            item = 14655, -- Venerer Ring
            gil = 4000,
            var = "ChasingDreams",
        })
    then
       player:addFame(RABAO, 300)
       player:addFame(NORG, 300)
    end
end

