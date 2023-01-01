-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Kevan
-- !pos -308.59 -12 -94.23 87
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
------------------------------

function onTrade(player, npc, trade)
    local trades =
    {
        { tpz.items.BRONZE_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_I },
        { tpz.items.BRASS_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_II },
        { tpz.items.SHAKUDO_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_III },
        { tpz.items.PAKTONG_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_IV },
        { tpz.items.PIG_IRON_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_V },
        { tpz.items.IRON_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_VI },
        { tpz.items.CAST_IRON_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_VII },
        { tpz.items.WROUGHT_IRON_LETTERBOX, tpz.keyItem.THE_WORDS_OF_DONHU_VIII },
    }
    for _, letterboxes in pairs(trades) do
        if npcUtil.tradeHasExactly(trade,letterboxes[1], true) and not player:hasKeyItem(letterboxes[2]) then 
            player:messageSpecial(ID.text.SCNM_CONTRAINER_TRADE, 1041, 4, 0, 0)
            player:addKeyItem(letterboxes[2])
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, letterboxes[2])
            player:messageSpecial(ID.text.PROSPERITY_RISEN, 1, 7, 0, 0)
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:startEvent(334)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
