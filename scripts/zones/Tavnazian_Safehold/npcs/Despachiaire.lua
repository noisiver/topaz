-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Despachiaire
-- !pos 108 -40 -83 26
-- TODO: Tango with a tracker and Requiem of Sin quest logic
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
-----------------------------------
-- TODO:
-- Starts quests: "X Marks the Spot"
--                "Elderly Pursuits"
--                "Tango with a Tracker"
--                "Requiem of Sin"
-- Involved in:   "Secrets of Ovens Lost"
-- https://github.com/project-topaz/topaz/issues/1481

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local copCurrentMission = player:getCurrentMission(COP)
    local copMissionStatus = player:getCharVar("PromathiaStatus")
    local copMissions = tpz.mission.id.cop
    local tangoWithTracker = player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.TANGO_WITH_A_TRACKER)
    local RequiemOfSinCD = player:getCharVar("[ENM]RequiemOfSin")

    -- COP 2-2 "The Lost City"
    if copCurrentMission == copMissions.THE_LOST_CITY and copMissionStatus == 0 then
        player:startEvent(102)
    -- COP 4-1 "Sheltering Doubt"
    elseif copCurrentMission == copMissions.SHELTERING_DOUBT and copMissionStatus == 1 then
        player:startEvent(108)
    -- COP 4-4 "Slanderous Utterings" is an area approach handled in Tavnazian_Safehold/Zone.lua
    -- COP 5-1 "Sheltering Doubt" (optional)
    elseif
        copCurrentMission == copMissions.THE_ENDURING_TUMULT_OF_WAR and
        copMissionStatus == 0 and
        player:getCharVar("COP_optional_CS_Despachaire") == 0
    then
        player:startEvent(117)
    -- COP 5-3 "Three Paths"
    elseif copCurrentMission == copMissions.THREE_PATHS then
        if player:getCharVar("COP_Louverance_s_Path") == 0 then
            player:startEvent(118)
        else
            player:startEvent(134)
        end
    -- Tango with a Tracker. Dawn completed check might bug and need a diff way to get it
    elseif (copCurrentMission >= copMissions.DAWN) and (tangoWithTracker == QUEST_AVAILABLE) then
        player:startEvent(576)
    -- Requiem of Sin
    elseif (tangoWithTracker == QUEST_COMPLETED) and (RequiemOfSinCD > os.time()) and not player:hasKeyItem(tpz.ki.LETTER_FROM_SHIKAREE_Y) then
        player:startEvent(578)
    -- COP Default dialogue change
    elseif player:getCurrentMission(COP) > copMissions.DARKNESS_NAMED then
        player:startEvent(315) -- "Jeuno offered its help"; TODO: might trigger as early as 5-2?
    -- Default dialogue
    else
        player:startEvent(106)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 102 or csid == 108 then
        player:setCharVar("PromathiaStatus", 2)
    elseif csid == 117 then
        player:setCharVar("COP_optional_CS_Despachaire", 1)
    elseif csid == 118 then
        player:setCharVar("COP_Louverance_s_Path", 1)
    elseif csid == 576 then
        npcUtil.giveKeyItem(player, tpz.ki.LETTER_FROM_SHIKAREE_X)
        player:setCharVar("tangoWithTracker", 1)
    elseif csid == 578 then
        npcUtil.giveKeyItem(player, tpz.ki.LETTER_FROM_SHIKAREE_Y)
        player:setCharVar("[ENM]RequiemOfSin", getConquestTally())
    end
end

-- TODO: cutscenes including Despachiaire for reference
--Despachiaire     102 ++
--Despachiaire     104 ++
--Despachiaire     106 ++
--Despachiaire     107 ++
--Despachiaire     108 ++
--Despachiaire     110 ++
--Despachiaire     112 ++
--Despachiaire     117 ++
--Despachiaire     118 ++
--Despachiaire     132
--Despachiaire     133
--Despachiaire     134 ??
--Despachiaire     139
--Despachiaire     144 chat
--Despachiaire     149 XX
--Despachiaire     315 chat
--Despachiaire     317 chat
--Despachiaire     318 chat
--Despachiaire     505 CS
--Despachiaire     517 CS (despachiaire's wife)
--Despachiaire     518 CS (ulmia mother)
--Despachiaire     576 CS
--Despachiaire     577 chat
--Despachiaire     578 chat
--Despachiaire     579 chat
--Despachiaire     617 XX
--Despachiaire     618 XX
