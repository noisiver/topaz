-----------------------------------
-- Area: Tavnazian Safehold
--   NPC: Nivorajean
-- Type: Standard NPC
-- !pos 15.890 -22.999 13.322 26
-- Paradise Salvation and Maps quest
-- 
-----------------------------------
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local sacMapQuest = player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.PARADISE_SALVATION_AND_MAPS)
    local sacMapProgress = player:getCharVar("sacMapQuest")
    local nivorajeanDialogue = player:getLocalVar("nivorajeanDialogue")

    if (sacMapQuest == QUEST_AVAILABLE) then
        player:startEvent(223)
    elseif (sacMapProgress == 1) then
        player:startEvent(224)
    elseif player:hasKeyItem(tpz.ki.PIECE_OF_RIPPED_FLOORPLANS) then
        player:startEvent(225)
    elseif (sacMapProgress == 2) then
        player:startEvent(228, 7, 0, 2964, 0, 67108863, 4210705, 4095, 4)
    elseif (nivorajeanDialogue == 0) then -- Rotates between two messages when talking to him
        player:startEvent(222)
    elseif (nivorajeanDialogue == 1) then  -- Rotates between two messages when talking to him
        player:startEvent(382)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 222 then  -- Rotates between two messages when talking to him
        player:setLocalVar("nivorajeanDialogue", 1)
    elseif csid == 382 then  -- Rotates between two messages when talking to him
        player:setLocalVar("nivorajeanDialogue", 0)
    elseif csid == 223 then
        player:addQuest(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.PARADISE_SALVATION_AND_MAPS)
        player:setCharVar("sacMapQuest", 1)
    elseif csid == 225 then
        player:setCharVar("sacMapQuest", 2)
    elseif csid == 228 then
        npcUtil.completeQuest(player, OTHER_AREAS_LOG, tpz.quest.id.otherAreas.PARADISE_SALVATION_AND_MAPS, {
            ki = tpz.ki.MAP_OF_THE_SACRARIUM,
            gil = 2000,
            xp = 15000,
            var = "sacMapQuest",
        })
    end
end
