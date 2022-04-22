-----------------------------------
--
-- Zone: Silver_Sea_route_to_Nashmau (58)
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Nashmau/IDs")
-----------------------------------
local mobList = {
    17014791,
    17014792,
    17014793,
    17014794,
    17014795,
    17014796,
    17014798,
    17014801
}

function onInitialize(zone)
    -- 5% Chance to spawn a random mob from table when boat trip begins
	if math.random(1,100) <= 5 then 
        GetMobByID(mobList[math.random(#mobList)]):spawn()
    end

    -- Despawn previous boat rides mobs
    for v = 17014791, 17014796, 1 do
        DespawnMob(v)
    end
    DespawnMob(GetMobByID(17014798))
    DespawnMob(GetMobByID(17014801))
end


function onZoneIn(player, prevZone)
    local cs = -1

    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(1025)
    player:messageSpecial(ID.text.DOCKING_IN_NASHMAU)
    -- Despawn previous boat rides mobs
    for v = 17678342, 17678351, 1 do
        DespawnMob(v)
    end
end

function onGameHour(zone)
    -- 5% Chance to spawn a random mob from table every hour
    if VanadielHour() % 1 == 0 then
		if math.random(1,100) <= 5 then 
            GetMobByID(mobList[math.random(#mobList)]):spawn()
        end
    end
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 1025) then
        player:setPos(0, 0, 0, 0, 53)
    end
end
