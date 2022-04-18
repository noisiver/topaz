-----------------------------------
-- Area:  Bibiki Bay
-- NPC:   ???
-- Notes: Involved in the Quest "One Good Deed?"
-- Spawns 6 Peerifools
-- !pos -321.699 -2.739 -735.332 4
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("OneGoodDead") == 1) then
        for v = 16793711, 16793716, 1 do
            npcUtil.popFromQM(player, npc, v, {hide = 0}) 
        end
        local zonePlayers = npc:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:messageSpecial(ID.text.TRAP)
        end
    elseif (player:getCharVar("OneGoodDead") == 2) then
        player:startEvent(34)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 34) then
        player:addKeyItem(tpz.ki.DEED_TO_PURGONORGO_ISLE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.DEED_TO_PURGONORGO_ISLE)
        player:setCharVar("OneGoodDead", 3)
    end
end
