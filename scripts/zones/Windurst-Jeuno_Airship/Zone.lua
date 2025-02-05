-----------------------------------
--
-- Zone: Windurst-Jeuno_Airship
--
-----------------------------------
local ID = require("scripts/zones/Windurst-Jeuno_Airship/IDs")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0) then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(100)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
	local prevzone = player:getPreviousZone()
	if (prevzone == tpz.zone.PORT_JEUNO) then
		player:setPos(0, 0, 0, 0, 240)
	elseif (prevzone == tpz.zone.PORT_WINDURST) then
		player:setPos(0, 0, 0, 0, 246)
	end
end
