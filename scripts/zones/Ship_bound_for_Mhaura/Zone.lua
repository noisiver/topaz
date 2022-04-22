-----------------------------------
--
-- Zone: Ship_bound_for_Mhaura (221)
--
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Mhaura/IDs")
-----------------------------------
local mobList = {
    17682438,
    17682439,
    17682440,
    17682441,
    17682442,
    17682446,
}

function onInitialize(zone)
    -- 5% Chance to spawn a random mob from table when boat trip begins
	if math.random(1,100) <= 5 then 
        GetMobByID(mobList[math.random(#mobList)]):spawn()
    end

    -- Despawn previous boat rides mobs
    for v = 17682438, 17682446, 1 do
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
    player:startEvent(512)
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
    if (csid == 512) then
        player:setPos(0, 0, 0, 0, 249)
    end
end
