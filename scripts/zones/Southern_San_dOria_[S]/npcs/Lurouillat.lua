-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Lurouillat
-- !pos 44 2 -35 80
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
------------------------------

function onTrade(player, npc, trade)
    local trades =
    {
        { tpz.items.MAPLE_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_I },
        { tpz.items.MAGNOLIA_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_II },
        { tpz.items.BEECH_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_III },
        { tpz.items.EVERGREEN_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_IV },
        { tpz.items.HOLLY_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_V },
        { tpz.items.OAK_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VI },
        { tpz.items.ELM_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VII },
        { tpz.items.WILLOW_STRONGBOX, tpz.keyItem.IMPERIAL_LINEAGE_CHAPTER_VIII },
    }
    for _, letterboxes in pairs(trades) do
        if npcUtil.tradeHasExactly(trade,letterboxes[1], true) and not player:hasKeyItem(letterboxes[2]) then 
            player:messageSpecial(ID.text.SCNM_CONTRAINER_TRADE, 1030, 20, 1, 0)
            player:addKeyItem(letterboxes[2])
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, letterboxes[2])
            player:messageSpecial(ID.text.PROSPERITY_RISEN, 0, 4, 1, 0)
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(350)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
