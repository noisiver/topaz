-----------------------------------
--
-- Zone: Manaclipper (3)
--
-----------------------------------
local ID = require("scripts/zones/Manaclipper/IDs")
require("scripts/globals/manaclipper")
require("scripts/globals/conquest")
require("scripts/globals/zone")
-----------------------------------
local mobList = {
    16789511,
    16789512,
    16789513,
    16789514,
    16789515,
    16789516,
    16789517,
    16789518,
}

function onInitialize(zone)
    -- 5% Chance to spawn a random mob from table when boat trip begins
	if math.random(1,100) <= 5 then 
        GetMobByID(mobList[math.random(#mobList)]):spawn()
    end

    -- Despawn previous boat rides mobs
    for v = 16789511, 16789518, 1 do
        DespawnMob(v)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1

    tpz.manaclipper.onZoneIn(player)

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(0, -3, -8, 60)
    end

    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(100)
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

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 100 then
        player:setPos(0, 0, 0, 0, tpz.zone.BIBIKI_BAY)
    end
end
