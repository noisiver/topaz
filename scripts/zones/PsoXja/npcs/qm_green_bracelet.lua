-----------------------------------
-- Area: Pso'xja
--  NPC: ???
-- !pos -329.980 28.300 -163.000 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("AReputationInRuins") == 4) then
        player:addKeyItem(tpz.ki.GREEN_BRACELET)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.GREEN_BRACELET)
        player:setCharVar("AReputationInRuins", 5)
    elseif (player:getCharVar("AReputationInRuins") == 3) then
        local zonePlayers = npc:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:messageSpecial(ID.text.TRAP_ACTIVATED)
        end
        SpawnMob(ID.mob.GARGOYLE_LAMBDA):updateClaim(player)
        SpawnMob(ID.mob.GARGOYLE_MU):updateClaim(player)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
