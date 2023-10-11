-----------------------------------
-- Area: Gates of Halvung
--  NPC: _1p2
-- !pos 189 -17.300 -20
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:hasKeyItem(tpz.ki.CAST_METAL_PLATE) then
		GetNPCByID(17027541):openDoor(11)
    else
        player:messageSpecial(ID.text.HALVUNG_GATE_NO_KI)
        player:setLocalVar("CastMetalPlate", 1)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
