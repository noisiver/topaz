-----------------------------------
-- Area: Halvung
-- NPC:  Operating Lever
-- !pos -117.805 -11.658 223.100 62
-------------------------------------
local ID = require("scripts/zones/Halvung/IDs");

function onTrigger(player, npc)
    if GetNPCByID(npc:getID() - 2):getAnimation() == tpz.anim.CLOSE_DOOR then
        players = npc:getLocalVar("players") + 1
        if players >= 5 then
            player:messageName(ID.text.OPERATING_LEVER_SUCCESS, player)
            GetNPCByID(npc:getID() - 1):openDoor(25)
            npc:timer(1000, function(npc)
                GetNPCByID(npc:getID() - 2):openDoor(24)
            end)
            npc:setLocalVar("players", 0)
        else
            player:startEvent(100)
            player:messageName(ID.text.OPERATING_LEVER_START, player)
            npc:setLocalVar("players", players)
        end
    end
end

function onEventFinish(player, csid, option)
    if option == 0 then
        player:messageName(ID.text.OPERATING_LEVER_FAIL, player)
        npc:setLocalVar("players", npc:getLocalVar("players") - 1)
    end
end
