------------------------------------
-- Area: Dangruf Wadi
--  NPC: Strange Apparatus
-- !pos -494 -4 -100 191
local ID = require("scripts/zones/Dangruf_Wadi/IDs")
require("scripts/globals/mobs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------



function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, tpz.items.RED_CHIP) then
        --  print("we got an item, boss!")
        if npcUtil.popFromQM(player, npc, ID.mob.KOGARASUMARU) then -- items and mob id here under mob = in IDs.lua
            -- print("we can pop the mob, boss!")
            player:showText(npc, ID.text.SYS_OVERLOAD)
            MessageGroup(npc, player, "Why has a mere mortal awakened me from my slumber?", 0, "Kogarasumaru")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, tpz.items.BLACK_CHIP) then
        --  print("we got an item, boss!")
        if npcUtil.popFromQM(player, npc, ID.mob.ULBRECHT) then -- items and mob id here under mob = in IDs.lua
            -- print("we can pop the mob, boss!")
            player:showText(npc, ID.text.SYS_OVERLOAD)
            MessageGroup(npc, player, "Time to teach you a real lesson in magic.", 0, "Ulbrecht")
            player:confirmTrade()
        end
    elseif npcUtil.tradeHasExactly(trade, tpz.items.WHITE_CHIP) then
        --  print("we got an item, boss!")
        if npcUtil.popFromQM(player, npc, ID.mob.CHERUKIKI) then -- items and mob id here under mob = in IDs.lua
            -- print("we can pop the mob, boss!")
            player:showText(npc, ID.text.SYS_OVERLOAD)
            MessageGroup(npc, player, "Come on! Let me at 'em! A good punch is nothing without a couple black eyes!", 0, "Cherukiki")
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.DEVICE_NOT_WORKING) -- put special message when clicking ??? here from IDs.lua of the zone
end


function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end