-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Pogigi
-- Type: Sealed Container
-- !pos -29.787 -4.499 42.603 94
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    local trades =
    {
        { tpz.items.BAMBOO_GRASS_BASKET, tpz.keyItem.HABALOS_ECLOGUE_VERSE_I },
        { tpz.items.BAMBOO_MEDICINE_BASKET, tpz.keyItem.HABALOS_ECLOGUE_VERSE_II },
        { tpz.items.BAMBOO_BUGCAGE, tpz.keyItem.HABALOS_ECLOGUE_VERSE_III },
        { tpz.items.BAMBOO_FLOWER_BASKET, tpz.keyItem.HABALOS_ECLOGUE_VERSE_IV },
        { tpz.items.BAMBOO_BIRDCAGE, tpz.keyItem.HABALOS_ECLOGUE_VERSE_V },
        { tpz.items.BAMBOO_CHARCOAL_BASKET, tpz.keyItem.HABALOS_ECLOGUE_VERSE_VI },
        { tpz.items.BAMBOO_TEA_BASKET, tpz.keyItem.HABALOS_ECLOGUE_VERSE_VII },
        { tpz.items.BAMBOO_SNAKECAGE, tpz.keyItem.HABALOS_ECLOGUE_VERSE_VIII },
    }
    for _, letterboxes in pairs(trades) do
        if npcUtil.tradeHasExactly(trade,letterboxes[1], true) and not player:hasKeyItem(letterboxes[2]) then 
            player:messageSpecial(ID.text.SCNM_CONTRAINER_TRADE, 1049, 23, 2964, 0)
            player:addKeyItem(letterboxes[2])
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, letterboxes[2])
            player:messageSpecial(ID.text.PROSPERITY_RISEN, 2, 7, 2964, 0)
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(330)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end