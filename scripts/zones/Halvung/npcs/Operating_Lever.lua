-----------------------------------
-- Area: Halvung
-- NPC:  Operating Lever
-- !pos -240.000 15.939 -380.000 65
-------------------------------------
local ID = require("scripts/zones/Halvung/IDs");

function onTrigger(player, npc)
    if GetNPCByID(npc:getID() - 2):getAnimation() == tpz.anim.CLOSE_DOOR then
        players = npc:getLocalVar("players") + 1
        if players >= 3 then
            player:messageName(ID.text.OPERATING_LEVER_SUCCESS, player)
            GetNPCByID(npc:getID() - 1):openDoor(25)
            npc:timer(1000, function(npc)
                GetNPCByID(npc:getID() - 2):openDoor(24)
            end)
            npc:setLocalVar("players", 0)
        else
            player:messageName(ID.text.OPERATING_LEVER_START, player)
            player:startEvent(100)
            npc:setLocalVar("players", players)
        end
    end
end

function onEventFinish(player, csid, option, npc)
    if option == 0 then
        player:messageName(ID.text.OPERATING_LEVER_FAIL, player)
        npc:setLocalVar("players", npc:getLocalVar("players") - 1)
    end
end
