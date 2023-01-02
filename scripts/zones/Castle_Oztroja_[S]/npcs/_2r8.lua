-----------------------------------
-- Area: Castle_Oztroja [S]
-- A Malicious Manifest BCNM Entrance
-- !gotoid 17183546
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
-----------------------------------

function onTrigger(player, npc)
    if
    (player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_I) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_II) and
    player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_III) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_IV) and
    player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_V) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VI) and
    player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VII) and player:hasKeyItem(tpz.keyItem.HABALOS_ECLOGUE_VERSE_VIII)) or
    player:hasStatusEffect(tpz.effect.BATTLEFIELD)
    then
        if EventTriggerBCNM(player, npc) then
            return 
        end
    else
        player:messageSpecial(ID.text.DOOR_LOCKED)
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
