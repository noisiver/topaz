-----------------------------------
-- Area: Phomiuna Aqueducts
--   NPC: qm7 (???)
-- Notes: Aqueducts map mini-quest
-- !pos 83.219 -25.047 8.010
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/status")
local ID = require("scripts/zones/Phomiuna_Aqueducts/IDs");

local MAP_QM_POSITIONS         = 
{
    [1] = {83.219,-25.047,8.010},
    [2] = {83.749,-24.030,113.685},
    [3] = {-78.219,-25.047,8.010},
    [4] = {-77.219,-25.047,111.010}
}

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:hasKeyItem(tpz.ki.MAP_OF_THE_AQUEDUCTS) then
        return
    end

    local newPosition = npcUtil.pickNewPosition(npc:getID(), MAP_QM_POSITIONS, true);
    npc:hideNPC(1800);
    npc:setPos(newPosition.x, newPosition.y, newPosition.z);
    npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_THE_AQUEDUCTS)
end; 

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

