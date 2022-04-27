-----------------------------------
--
-- Zone: Boneyard_Gully (8)
--
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-709.508, 18.066, 456.241, 24)
    end
    if (player:getCharVar("OneGoodDeed") == 4) then
        cs = 8
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 8) then
        player:addKeyItem(tpz.ki.MAP_OF_THE_ATTOHWA_CHASM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MAP_OF_THE_ATTOHWA_CHASM)
        player:setCharVar("OneGoodDeed", 5)
    end
end
