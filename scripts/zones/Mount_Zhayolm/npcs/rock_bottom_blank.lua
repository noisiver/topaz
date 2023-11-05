-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Blank (For Rock Bottom Mount Zhayolm Map Quest)
-- !pos 838.243 -14.475 231.871 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/items")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if (player:getCharVar("RockBottom") == 1) and npcUtil.tradeHasExactly(trade, tpz.items.PICKAXE) then
        player:startEvent(8)
    elseif (player:getCharVar("RockBottom") == 2) and (player:needToZone() == false) and npcUtil.tradeHas(trade, {tpz.items.MYTHRIL_PICK, tpz.items.MYTHRIL_PICK_HQ}) then
        player:startEvent(9)
    end
end

function onTrigger(player, npc)
    if (player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.ROCK_BOTTOM) == QUEST_AVAILABLE) then
        player:startEvent(7)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 7) then
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.ROCK_BOTTOM)
        player:setCharVar("RockBottom", 1)
    elseif (csid == 8) then
        player:needToZone(true)
        player:setCharVar("RockBottom", 2)
    elseif (csid == 9) then
        player:confirmTrade()
        npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.ROCK_BOTTOM, {
            ki = tpz.ki.MAP_OF_MOUNT_ZHAYOLM,  
            var = "RockBottom", 
        })
    end
end
