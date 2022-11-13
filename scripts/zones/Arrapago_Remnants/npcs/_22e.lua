
local ID = require("scripts/zones/Arrapago_Remnants/IDs")

function onTrigger(entity, npc)
    if npc:getAnimation() == 8 then
        npc:untargetable(true)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(entity, eventid, result, door)
end
