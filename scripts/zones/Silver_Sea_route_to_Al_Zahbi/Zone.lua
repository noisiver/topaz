-----------------------------------
--
-- Zone: Silver_Sea_route_to_Al_Zahbi (59)
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/IDs")
-----------------------------------
local mobList = {
    17018887,
    17018888,
    17018889,
    17018890,
    17018891,
    17018892,
    17018894,
    17018897

}

function onInitialize(zone)
    -- 5% Chance to spawn a random mob from table when boat trip begins
	if math.random(1,100) <= 5 then 
        GetMobByID(mobList[math.random(#mobList)]):spawn()
    end

    -- Despawn previous boat rides mobs
    for v = 17018887, 17018892, 1 do
        DespawnMob(v)
    end
    DespawnMob(GetMobByID(17018894))
    DespawnMob(GetMobByID(17018897))
end

function onZoneIn(player, prevZone)
    local cs = -1

    return cs
end

function onRegionEnter(player, region)
end

function onTransportEvent(player, transport)
    player:startEvent(1025)
    player:messageSpecial(ID.text.DOCKING_IN_AL_ZAHBI)
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

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 1025) then
        player:setPos(0, 0, 0, 0, 50)
    end
end
