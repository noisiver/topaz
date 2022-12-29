-----------------------------------
-- Area: Beadeaux_[S]
-- The Buried God BCNM Entrance
-- !gotoid 17154818
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
-----------------------------------

function onTrigger(player, npc)
    if
    (player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_I) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_II) and
    player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_III) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_IV) and
    player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_V) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VI) and
    player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VII) and player:hasKeyItem(tpz.keyItem.THE_WORDS_OF_DONHU_VIII))
    or player:getGMLevel() > 0
    then
        if EventTriggerBCNM(player, npc) then
            return 
        end
    else
        player:messageSpecial(ID.text.DOOR_LOCKED)
    end
end

function onTrade(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, tpz.items.QUADAV_CHARM, true) then
        npc:openDoor()
    end
end

function onEventUpdate(player, csid, option)
    -- printf("onUpdate CSID: %u", csid)
    -- printf("onUpdate RESULT: %u", option)
    local res = EventUpdateBCNM(player, csid, option)
    print(res)
    return res
end

function onEventFinish(player, csid, option)
    -- printf("onFinish CSID: %u", csid)
    -- printf("onFinish RESULT: %u", option)

    if EventFinishBCNM(player, csid, option) then
        return
    end
end
