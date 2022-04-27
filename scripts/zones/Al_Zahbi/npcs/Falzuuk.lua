-----------------------------------
-- Area: Al Zahbi
--  NPC: Falzuuk
-- Type: Imperial Gate Guard
-- !pos -60.486 0.999 105.397 48
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 2174, 1) then -- Archaic Mirror
            player:confirmTrade()
            player:addCurrency("imperial_standing", 1000)
            player:PrintToPlayer("Great job out there. This will help us survive the next beastmen attack. Bring me as many of these as you can.",0,"Falzuuk")
            player:PrintToPlayer("You recieved imperial standing!",0,"Falzuuk")
    end
end

function onTrigger(player, npc)
    tpz.besieged.onTrigger(player, npc, 216)
end

function onEventUpdate(player, csid, option)
    tpz.besieged.onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    tpz.besieged.onEventFinish(player, csid, option)
end
