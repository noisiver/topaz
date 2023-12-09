-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Epinolle
-- Standard Info NPC
-- Go! Go! Gobmuffin! map quest
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local riverneMapQuest = player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.GO_GO_GOBMUFFIN)
    local riverneMapProgress = player:getCharVar("riverneMapQuest")

    if (riverneMapQuest == QUEST_AVAILABLE) then
        player:startEvent(232)
    elseif (riverneMapProgress == 4) then
        player:startEvent(234)
    elseif (riverneMapProgress == 1) then
        player:startEvent(233)
    elseif (riverneMapQuest == QUEST_COMPLETED) then
        player:startEvent(235)
    else
        player:startEvent(230)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 232 then
        player:addQuest(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.GO_GO_GOBMUFFIN)
        player:setCharVar("riverneMapQuest", 1)
    elseif csid == 234 then
        npcUtil.completeQuest(player, OTHER_AREAS_LOG, tpz.quest.id.otherAreas.GO_GO_GOBMUFFIN, {
            ki = tpz.ki.MAP_OF_CAPE_RIVERNE,
            gil = 2000,
            xp = 15000,
            var = "riverneMapQuest",
        })
    end
end
