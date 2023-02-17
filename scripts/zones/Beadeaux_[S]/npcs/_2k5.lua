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
    if EventTriggerBCNM(player, npc) then
        return 
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
