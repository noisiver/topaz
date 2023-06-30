-----------------------------------
-- Area: Port Windurst
--  NPC: Chipmy-Popmy
-- Working 100%
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local currentday = tonumber(os.date("%j"))
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.DAWN and player:getCharVar("PromathiaStatus")==3 and player:getCharVar("Promathia_kill_day") ~= currentday and player:getCharVar("COP_3-taru_story")== 0 ) then
        player:startEvent(619)
    elseif (player:getMainLvl() >= 7 and player:getQuestStatus(WINDURST, tpz.quest.id.windurst.ONE_GOOD_DEED) == QUEST_AVAILABLE) then
        player:startEvent(594)
    elseif (player:getCharVar("OneGoodDeed") == 1) then
        player:startEvent(596)
    elseif (player:getCharVar("OneGoodDeed") == 3) then
        player:startEvent(595)
    elseif (player:getCharVar("OneGoodDeed") == 4) then
        player:startEvent(599)
    elseif (player:getCharVar("OneGoodDeed") == 5) then
        player:startEvent(597)
    elseif (player:getCharVar("OneGoodDeed") == 6) then
        player:startEvent(598)
    else
        player:startEvent(202)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 619) then
        player:setCharVar("COP_3-taru_story", 1)
    end
    if (csid == 594 and option == 1) then
        player:addQuest(WINDURST, tpz.quest.id.windurst.ONE_GOOD_DEED)
        player:setCharVar("OneGoodDeed", 1)
    elseif (csid == 595) then
        player:delKeyItem(tpz.ki.DEED_TO_PURGONORGO_ISLE)
        player:setCharVar("OneGoodDeed", 4)
    elseif csid == 597 and
        npcUtil.completeQuest(player, WINDURST, tpz.quest.id.windurst.ONE_GOOD_DEED, {
            gil = 3200,
            fame = 300,
            xp = 15000,
            var = "OneGoodDeed",
        })
    then
       player:setCharVar("OneGoodDeed", 6)
    elseif (csid == 598) then
        player:setCharVar("OneGoodDeed", 7)
    end
end
