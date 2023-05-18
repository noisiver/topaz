-----------------------------------
-- Area: Crawlers' Nest
--  NPC: Strange Apparatus
-- !pos 214 0 -339 197
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest/IDs")
require("scripts/globals/items")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, tpz.items.YELLOW_CHIP) then
        if npcUtil.popFromQM(player, npc, ID.mob.RAOGRIMM) then 
            utils.ShowTextParty(player, ID.text.SYS_OVERLOAD)
            utils.MessageParty(player, "Your kind will pay for your betrayal...", 0, "Raogrimm")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, tpz.items.PURPLE_CHIP) then
        if npcUtil.popFromQM(player, npc, ID.mob.NASHMEIRA) then 
            utils.ShowTextParty(player, ID.text.SYS_OVERLOAD)
            utils.MessageParty(player, "Let's go Mnejing!", 0, "Nashmeira")
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    utils.ShowTextParty(player, ID.text.DEVICE_NOT_WORKING)
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
