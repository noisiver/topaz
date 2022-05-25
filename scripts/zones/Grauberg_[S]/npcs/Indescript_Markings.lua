----------------------------------
-- Area: Grauberg [S]
--  NPC: Indescript Markings
-- Type: Quest
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local gownQuestProgress = player:getCharVar("AF_SCH_BODY")
    local seeingBloodRed = player:getQuestStatus(CRYSTAL_WAR, tpz.quest.id.crystalWar.SEEING_BLOOD_RED)
    local seeingBloodRedProgress = player:getCharVar("SeeingBloodRed")

    -- SCH AF Quest - Body
    if npc:getID() == 17142581 then
        if gownQuestProgress > 0 and gownQuestProgress < 3 and not player:hasKeyItem(tpz.ki.SAMPLE_OF_GRAUBERG_CHERT) then
            npcUtil.giveKeyItem(player, tpz.ki.SAMPLE_OF_GRAUBERG_CHERT)
            player:setCharVar("AF_SCH_BODY", gownQuestProgress + 1)
        else
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        end
    -- SCH AF3 Quest - Head
    elseif npc:getID() == 17142586 then
        if seeingBloodRed == QUEST_ACCEPTED and seeingBloodRedProgress == 2 then
            player:startEvent(14)
        elseif player:getCharVar("SeeingBloodRed") == 3 and player:hasKeyItem(tpz.ki.PORTING_MAGIC_TRANSCRIPT) then
            player:startEvent(15)
            player:delKeyItem(tpz.ki.PORTING_MAGIC_TRANSCRIPT)
            -- player:setPos(-323.6241, -23.8410, -19.5224, 93)
        else
            player:messageSpecial(ID.text.THERE_IS_NO_RESPONSE)
        end
    end
end

function onEventUpdate(player, csid, option, target)
end

function onEventFinish(player, csid, option, target)
    if csid == 14 then
        player:setCharVar("SeeingBloodRed", 3)
    elseif csid == 102 then
        player:setCharVar("SeeingBloodRed", 4)
    end
end

function onInstanceCreated(player, target, instance)
end
