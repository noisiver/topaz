-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Quasilumin
-- Type: Standard NPC
-- !pos 
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not player:hasKeyItem(tpz.ki.MAP_OF_HUXZOI) then
        local progress = player:getCharVar("huxzoi_map_progress")
        if progress == 1023 then
            player:showText(npc, ID.text.HUXZOI_MAP_COMPLETE, player:getRace())
            npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_HUXZOI)
            return
        else
            index = npc:getID() - ID.npc.QUASILUMIN_OFFSET
            if bit.band(progress, bit.lshift(1, index)) ~= 1 then
                player:setCharVar("huxzoi_map_progress", bit.bor(progress, bit.lshift(1, index)))
            end
        end
    end
    player:showText(npc, ID.quasilumin_text[npc:getID()])
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
