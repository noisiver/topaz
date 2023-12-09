-----------------------------------
-- Area: The Boyahda Tree
--  NPC: Mandragora Warden
-- Type: NPC
-- Accepts items for Garden Bangles / Feronia's Bangles
-- !pos 99.068 8.548 122.514 153
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, { tpz.items.CLUMP_OF_GREAT_BOYAHDA_MOSS, tpz.items.FOUR_LEAF_KORRIGAN_BUD } ) then
        -- 10% chance at Feronia's Bangles'(HQ), 90% at Garden
        if (math.random(100) <= 10) then
            npcUtil.giveItem(player, tpz.items.FERONIAS_BANGLES)
        else
            npcUtil.giveItem(player, tpz.items.GARDEN_BANGLES)
        end
        player:tradeComplete()
    end
end

function onTrigger(player, npc)
    player:startEvent(11)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
