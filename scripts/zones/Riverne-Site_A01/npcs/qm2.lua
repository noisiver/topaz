-----------------------------------
-- Area: Riverne Site #A01
--  NPC: qm2
-- Gives ??? pop for Shield Trap
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, 1881) then -- Shield Bug
        if npcUtil.popFromQM(player, npc, ID.mob.SHIELDTRAP) then 
            player:confirmTrade()
        end
	end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY) -- put special message when clicking ??? here from IDs.lua of the zone
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
