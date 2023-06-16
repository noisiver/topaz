-----------------------------------
--
-- Zone: Silver_Sea_route_to_Nashmau (58)
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Nashmau/IDs")
require("scripts/globals/sea_creatures")
-----------------------------------
function onInitialize(zone)
    zone:addListener("TRANSPORTZONE_END", "MHAURA_TRANSPORTZONE_END", function(transportZone)
        if GetMobByID(ID.mob.UTUKKU):isSpawned() then
            DespawnMob(ID.mob.UTUKKU)
        end
        if GetMobByID(ID.mob.PROTEUS):isSpawned() then
            DespawnMob(ID.mob.PROTEUS)
        end
        tpz.sea_creatures.despawn(ID)
    end)

    zone:addListener("TRANSPORTZONE_START", "MHAURA_TRANSPORTZONE_START", function(transportZone)
        if GetMobByID(ID.mob.PROTEUS):isSpawned() then
            DespawnMob(ID.mob.PROTEUS)
        end
        tpz.sea_creatures.checkSpawns(ID, 5, 1) -- 5 percent on init
    end)

    zone:addListener("TRANSPORTZONE_UPDATE", "MHAURA_TRANSPORTZONE_UPDATE", function(transportZone, tripTime)
        tpz.sea_creatures.checkSpawns(ID, 1, 2) -- 1 percent per vana minute, 2 total mobs
    end)
end

function onZoneIn(player, prevZone)
    local cs = -1

    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(1025)
end

function onGameHour(zone)
    local hour = VanadielHour()
    if hour >= 20 or hour < 4 then
        if math.random() < 0.20 and not GetMobByID(ID.mob.UTUKKU):isSpawned() then
            GetMobByID(ID.mob.UTUKKU):spawn()
        end
    elseif GetMobByID(ID.mob.UTUKKU):isSpawned() then
        DespawnMob(ID.mob.UTUKKU)
    end

    local mob = GetMobByID(ID.mob.PROTEUS)
    -- 3% chance per game hour (if not spawned, and min repop time)
    if math.random(0, 100) < 3 and not mob:isSpawned() and os.time() > mob:getLocalVar("respawnTime") then
        mob:spawn()
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
