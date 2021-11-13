-----------------------------------
-- Area: Al'Taieu
--  NPC: Quasilumin
-- Type: Standard NPC
-- !pos -27.443 -1 -636.850 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    if not player:hasKeyItem(tpz.ki.MAP_OF_ALTAIEU) then
        local progress = player:getVar("altaieu_map_progress")
        if progress == 1048575 then
            player:showText(npc, ID.text.ALTAIEU_MAP_COMPLETE)
            npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_ALTAIEU)
            return
        else
            index = npc:getID() - ID.npc.QUASILUMIN_OFFSET
            if bit.band(progress, bit.lshift(1, index)) ~= 1 then
                player:setVar("altaieu_map_progress", bit.bor(progress, bit.lshift(1, index)))
            end
        end
    end
    player:showText(npc, ID.quasilumin_text[npc:getID()])
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
