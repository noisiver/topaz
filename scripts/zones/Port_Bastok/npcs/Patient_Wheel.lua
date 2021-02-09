-----------------------------------
-- Area: Port Bastok
--  NPC: Patient Wheel
-- Type: Quest NPC
-- !pos -107.988 3.898 52.557 236
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player, npc, trade)
    if (player:getCharVar("ChasingDreams") == 11) then
        if (trade:hasItemQty(1664, 5) and trade:getItemCount() == 5) then
             player:startEvent(323)
        end
    end
end

function onTrigger(player, npc)

    local WildcatBastok = player:getCharVar("WildcatBastok")
    local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)

    if (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatBastok, 1)) then
        player:startEvent(354)
    elseif (player:getCharVar("ChasingDreams") == 11) then
         player:startEvent(326)
    else
        player:startEvent(325)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 354) then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 1, true))
    elseif (csid == 323) then
        player:setCharVar("ChasingDreams", 12)
    end
end
