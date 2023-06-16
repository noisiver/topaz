-----------------------------------
--
-- Zone: Open_sea_route_to_Al_Zahbi (46)
--
-----------------------------------
local ID = require("scripts/zones/Open_sea_route_to_Al_Zahbi/IDs")
require("scripts/globals/sea_creatures")
-----------------------------------
function onInitialize(zone)
    zone:addListener("TRANSPORTZONE_END", "MHAURA_TRANSPORTZONE_END", function(transportZone)
        if GetMobByID(ID.mob.REVENANT):isSpawned() then
            DespawnMob(ID.mob.REVENANT)
        end
        tpz.sea_creatures.despawn(ID)
    end)

    zone:addListener("TRANSPORTZONE_START", "MHAURA_TRANSPORTZONE_START", function(transportZone)
        tpz.sea_creatures.checkSpawns(ID, 5, 1) -- 5 percent on init
    end)

    zone:addListener("TRANSPORTZONE_UPDATE", "MHAURA_TRANSPORTZONE_UPDATE", function(transportZone, tripTime)
        tpz.sea_creatures.checkSpawns(ID, 1, 2) -- 1 percent per vana minute, 2 total mobs
    end)
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
end

function onGameHour(zone)
    local hour = VanadielHour()
    if hour >= 20 or hour < 4 then
        if math.random() < 0.20 and not GetMobByID(ID.mob.REVENANT):isSpawned() then
            GetMobByID(ID.mob.REVENANT):spawn()
        end
    elseif GetMobByID(ID.mob.REVENANT):isSpawned() then
        DespawnMob(ID.mob.REVENANT)
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
