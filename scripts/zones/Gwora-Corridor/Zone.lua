-----------------------------------
--
-- Zone: Labyrinth of Onzozo (213)
--
-----------------------------------
local ID = require("scripts/zones/Gwora-Corridor/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(0, 0, 0, 128)
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
end
