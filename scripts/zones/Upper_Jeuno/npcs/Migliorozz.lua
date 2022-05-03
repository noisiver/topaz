-----------------------------------
-- Area: Upper Jeuno
--   NPC: Migliorozz
-- Type: Standard NPC
-- !pos -37.760 -2.499 12.924 244
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Upper_Jeuno/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local aReputationInRuins = player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.A_REPUTATION_IN_RUINS)

    if (player:getCharVar("AReputationInRuins") == 6) then
        player:startEvent(10020)
    elseif aReputationInRuins == QUEST_AVAILABLE then
        player:startEvent(10019, 0, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, 0, 0, 0)
    elseif (player:getCharVar("AReputationInRuins") == 1) then
        player:startEvent(10021, 0, tpz.ki.PHOENIX_PEARL, 0, 0, 0, 0, 0, 0)
    elseif aReputationInRuins == QUEST_COMPLETED then
        player:startEvent(10022)
    else
        player:startEvent(10026)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 10019 and option == 3 then
        player:addQuest(JEUNO, tpz.quest.id.jeuno.A_REPUTATION_IN_RUINS)
        player:addKeyItem(tpz.ki.PHOENIX_PEARL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.PHOENIX_PEARL)
        player:setCharVar("AReputationInRuins", 1)
    elseif csid == 10020 and
        npcUtil.completeQuest(player, JEUNO, tpz.quest.id.jeuno.A_REPUTATION_IN_RUINS, {
            gil = 3500,
            fame = 1000, 
            var = "AReputationInRuins",
        })
    then
       player:setCharVar("AReputationInRuins", 0)
    end
end
