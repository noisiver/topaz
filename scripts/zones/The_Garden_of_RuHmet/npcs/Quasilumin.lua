-----------------------------------
-- Area: The Garden of Ru'Hmet
--  NPC: Quasilumin
-- Type: Standard NPC
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not player:hasKeyItem(tpz.ki.MAP_OF_RUHMET) then
        local progress = player:getCharVar("ruhmet_map_progress")
        if progress == 1023 then
            player:showText(npc, ID.text.RUHMET_MAP_COMPLETE, player:getRace())
            npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_RUHMET)
            return
        else
            index = npc:getID() - ID.npc.QUASILUMIN_OFFSET
            if bit.band(progress, bit.lshift(1, index)) ~= 1 then
                player:setCharVar("ruhmet_map_progress", bit.bor(progress, bit.lshift(1, index)))
            end
        end
    end
    if npc:getID() == 16921083 then
        player:showText(npc, ID.quasilumin_text[npc:getID()], 35, tpz.ki.BRAND_OF_DAWN, tpz.ki.BRAND_OF_TWILIGHT)
    else
        player:showText(npc, ID.quasilumin_text[npc:getID()])
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
