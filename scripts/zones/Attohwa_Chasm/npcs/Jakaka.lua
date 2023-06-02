-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Jakaka
-- Type: ENM
-- !pos -144.711 6.246 -250.309 7
-----------------------------------
local ID = require("scripts/zones/Attohwa_Chasm/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local MiasmaFilterCD = player:getCharVar("[ENM]MiasmaFilter")

    if (player:hasKeyItem(tpz.ki.MIASMA_FILTER)) then
        player:startEvent(11)
    else
        if (MiasmaFilterCD >= os.time()) then
            -- Both Vanadiel time and unix timestamps are based on seconds. Add the difference to the event.
            player:startEvent(14, VanadielTime()+(MiasmaFilterCD-os.time()))
        else
            player:startEvent(12)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 12) then
        player:addKeyItem(tpz.ki.MIASMA_FILTER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MIASMA_FILTER)
        player:setCharVar("[ENM]MiasmaFilter", os.time() + 432000) -- 5 days
    elseif (csid == 13) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1777) -- Flaxen Pouch
            return
        else
            player:addItem(1777)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1777) -- Flaxen Pouch
        end
    end
end
