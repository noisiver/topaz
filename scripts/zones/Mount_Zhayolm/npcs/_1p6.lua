-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Engraved Tablet
-- !pos 320 -15.35 -379 61
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:hasKeyItem(tpz.ki.SILVER_SEA_SALT) then
        player:startEvent(12)
    end
    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 12 and option == 1 then
        player:delKeyItem(tpz.ki.SILVER_SEA_SALT)
        player:setPos(318, -14, -585, 60) 
    end
end
