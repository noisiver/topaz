-----------------------------------
-- Area: Port San d'Oria
--  NPC: Altiret
-- NPC for Quest "The Pickpocket"
-- !pos 21.263 -3.999 -65.776 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
    -- THE PICKPOCKET
    if player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 579) then
        player:startEvent(550)

    -- DEFAULT DIALOG
    else
        player:startEvent(551)
    end
end

function onTrigger(player, npc)
    -- THE PICKPOCKET
    if player:getCharVar("thePickpocket") > 0 then
        player:startEvent(547)
    elseif player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_COMPLETED then
        player:startEvent(580)

    -- STANDARD DIALOG
    else
        player:startEvent(559)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- THE PICKPOCKET
    if csid == 547 and player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_AVAILABLE then
        player:addQuest(SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET)
    elseif csid == 550 then
        if (player:getFreeSlotsCount(0) >= 1) then
            npcUtil.completeQuest(player, SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET, {xp = 2000, fame = 250, title = tpz.title.PICKPOCKET_PINCHER, var = {"thePickpocket", "thePickpocketSkipNPC", "thePickpocketEagleButton"}})
            player:addItem(16667, 1, 97, 9) -- Pet: Attack+10 Ranged Attack+10
            player:confirmTrade()
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16667) -- Light Axe
        end
    end
end
