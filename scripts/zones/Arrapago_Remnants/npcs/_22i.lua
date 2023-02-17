
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/salvage")
require("scripts/globals/npc_util")
require("scripts/globals/items")

function onTrigger(entity, npc)
    if (npc:getInstance():getStage() == 7) then
        entity:startEvent(300)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        local instance = door:getInstance()
        entity:getEntity(bit.band(ID.npc[7].INNER_DOOR, 0xFFF), tpz.objType.NPC):setAnimation(8)    
        door:setAnimation(8)
        door:untargetable(true)
    end
end