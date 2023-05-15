-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Cast Metal Plate)
-- !pos 760.798 -14.972 1.656 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function relocate(npc)
    local positions =
    {
        {848.860, -16.309, 316.642},
        {589.927, -24.78, 204},
        {605, -23.99, 114},
        {597.945, -16.773, 21.706},
        {727.107, -21.396, -14.584},
        {466.979, -14.180, -48.296},
        {178.557, -13.927, -178.502},
        {279.865, -18.050, -297.263},
        {384.096, -15.177, -252.629},
    }
    local pos = npcUtil.pickNewPosition(npc:getID(), positions)
    npc:setPos(pos.x, pos.y, pos.z)
end

function onSpawn(npc)
    relocate(npc)
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not player:hasKeyItem(tpz.ki.CAST_METAL_PLATE) and player:getLocalVar("CastMetalPlate") == 1 then
        player:addKeyItem(tpz.ki.CAST_METAL_PLATE)
        player:messageSpecial(ID.text.HALVUNG_GATE_OBTAIN_KI, tpz.ki.CAST_METAL_PLATE)
        player:setLocalVar("CastMetalPlate", 0)
        relocate(npc)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
