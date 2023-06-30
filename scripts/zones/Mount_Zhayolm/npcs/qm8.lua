-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Toggle Switch PUP AF3)
-- !pos 760.798 -14.972 1.656 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.DETACHED_PART)
    if player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.PUPPETMASTER_BLUES) == QUEST_ACCEPTED and player:getCharVar("PuppetmasterBluesProgress") == 2 then
        player:addKeyItem(tpz.ki.TOGGLE_SWITCH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.TOGGLE_SWITCH)
        player:setCharVar("PuppetmasterBluesProgress", 3)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
