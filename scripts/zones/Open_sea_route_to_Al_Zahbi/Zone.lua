-----------------------------------
--
-- Zone: Open_sea_route_to_Al_Zahbi (46)
--
-----------------------------------
local ID = require("scripts/zones/Open_sea_route_to_Al_Zahbi/IDs")
-----------------------------------
local mobList = {
    16965640,
    16965641,
    16965642,
    16965643,
    16965644,
}

function onInitialize(zone)
    -- 5% Chance to spawn a random mob from table when boat trip begins
	if math.random(1,100) <= 5 then 
        GetMobByID(mobList[math.random(#mobList)]):spawn()
    end

    -- Despawn previous boat rides mobs
    for v = 16965640, 16965644, 1 do
        DespawnMob(v)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        local position = math.random(-2, 2) + 0.150
        player:setPos(position, -2.100, 3.250, 64)
    end
    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(1028)
    player:messageSpecial(ID.text.DOCKING_IN_AL_ZAHBI)
    -- Despawn previous boat rides mobs
    for v = 16965640, 16965644, 1 do
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
    if (csid == 1028) then
        player:setPos(0, 0, 0, 0, 50)
    end
end
