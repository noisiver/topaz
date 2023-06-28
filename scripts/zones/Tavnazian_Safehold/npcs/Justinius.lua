-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Justinius
-- Involved in mission : COP2-3
-- !pos 76 -34 68 26
-- https://gitlab.com/ffxiwings/wings/-/blob/master/scripts/zones/Tavnazian_Safehold/npcs/Justinius.lua
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/utils")
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
-----------------------------------

-- Cache COP missions for later reference
local copMissions = tpz.mission.id.cop

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local copCurrentMission = player:getCurrentMission(COP)
    local copMissionStatus = player:getCharVar("PromathiaStatus")
    local uninvitedGuests =  player:getCharVar("UninvitedGuestsStatus")

    -- COP 2-3
    if copCurrentMission == copMissions.DISTANT_BELIEFS and copMissionStatus == 3 then
        player:startEvent(113)
    -- COP 2-4
    elseif copCurrentMission == copMissions.AN_ETERNAL_MELODY and copMissionStatus == 1 then
        player:startEvent(127) -- optional dialogue
    -- COP 4-1
    elseif copCurrentMission == copMissions.SHELTERING_DOUBT and copMissionStatus == 2 then
        player:startEvent(109)
    -- COP 4-2
    elseif copCurrentMission == copMissions.THE_SAVAGE then
        if copMissionStatus == 2 then
            player:startEvent(110) -- finish mission
        else
            player:startEvent(130) -- optional dialogue
        end
    elseif player:hasCompletedMission(COP, tpz.mission.id.cop.THE_SAVAGE) and player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.UNINVITED_GUESTS) == QUEST_AVAILABLE then
        player:startEvent(570) -- Intial Uninvited Quest CS
    elseif uninvitedGuests == 1 then
        if not player:hasKeyItem(tpz.ki.MONARCH_LINN_PATROL_PERMIT) then
            player:addKeyItem(tpz.ki.MONARCH_LINN_PATROL_PERMIT)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MONARCH_LINN_PATROL_PERMIT)
        end
        player:startEvent(571) -- Reminds player to go to Monarch Linn
    elseif uninvitedGuests == 2 then 
        player:startEvent(572) -- Uninvited Guests Victory
    elseif uninvitedGuests == 3 or (uninvitedGuests == 4 and player:getCharVar("UninvitedGuestsReset")) == getConquestTally() then
        player:startEvent(575) -- Uninvited Guests Failure - mocks player until conquest tally
    elseif uninvitedGuests == 4 and player:getCharVar("UninvitedGuestsReset") ~= getConquestTally() then
        player:startEvent(574) -- Reissues permit post failure
    elseif player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.UNINVITED_GUESTS) == QUEST_COMPLETED and player:getCharVar("UninvitedGuestsReset") ~= getConquestTally() then
        player:startEvent(573) -- Repeatable Init CS
    else
        player:startEvent(123)
    end
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 113 then
        player:setCharVar("PromathiaStatus", 0)
        player:completeMission(COP, copMissions.DISTANT_BELIEFS)
        player:addMission(COP, copMissions.AN_ETERNAL_MELODY)
    elseif csid == 109 then
        player:setCharVar("PromathiaStatus", 3)
    elseif csid == 110 then
        player:setCharVar("PromathiaStatus", 0)
        player:completeMission(COP, copMissions.THE_SAVAGE)
        player:addMission(COP, copMissions.THE_SECRETS_OF_WORSHIP)
        player:addTitle(tpz.title.NAGMOLADAS_UNDERLING)
    elseif csid == 570 and option == 1 then
        player:addQuest(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.UNINVITED_GUESTS)
        player:addKeyItem(tpz.ki.MONARCH_LINN_PATROL_PERMIT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MONARCH_LINN_PATROL_PERMIT)
        player:setCharVar("UninvitedGuestsStatus", 1) -- accepted
    elseif csid == 572 then
        -- Complete Quest if Active
        if player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.UNINVITED_GUESTS) == QUEST_ACCEPTED then
            if npcUtil.completeQuest(player, OTHER_AREAS_LOG, tpz.quest.id.otherAreas.UNINVITED_GUESTS, {item = rewardId, title=tpz.title.MONARCH_LINN_PATROL_GUARD, var = {"UninvitedGuestsStatus", "UninvitedGuestsReward"}}) then
                updateUninvitedGuests(player, false)
            end
        else
            if(rewardId == 1) then -- special case for Gil
                if npcUtil.giveCurrency(player, "gil", 10000) then
                    updateUninvitedGuests(player, true)
                end
            elseif npcUtil.giveItem(player, rewardId) then
                updateUninvitedGuests(player, true)
            end
        end
    elseif csid == 574 or (csid == 573 and option == 1) then
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MONARCH_LINN_PATROL_PERMIT)
        player:addKeyItem(tpz.ki.MONARCH_LINN_PATROL_PERMIT)
        player:setCharVar("UninvitedGuestsStatus", 1) -- accepted
    elseif csid == 575 then
        if player:getCharVar("UninvitedGuestsStatus") == 3 then
            updateUninvitedGuests(player, false)
            player:setCharVar("UninvitedGuestsStatus", 4) -- Player has failed and must wait until conquest to retry
        end
    end
end

function updateUninvitedGuests(player, clearVars)
    player:setCharVar("UninvitedGuestsReset", getConquestTally())
    if clearVars then
        player:setCharVar("UninvitedGuestsStatus", 0)
        player:setCharVar("UninvitedGuestsReward", 0)
    end
end
