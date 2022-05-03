-----------------------------------
-- Area: Pso'xja
--  NPC: ???
-- !pos -282.742 -3.600 -210.000 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("AReputationInRuins") == 2) then
        player:addKeyItem(tpz.ki.BLUE_BRACELET)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BLUE_BRACELET)
        player:setCharVar("AReputationInRuins", 3)
    elseif (player:getCharVar("AReputationInRuins") == 1) then
        local zonePlayers = npc:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:messageSpecial(ID.text.TRAP_ACTIVATED)
        end
        SpawnMob(ID.mob.GARGOYLE_IOTA):updateClaim(player)
        SpawnMob(ID.mob.GARGOYLE_KAPPA):updateClaim(player)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
