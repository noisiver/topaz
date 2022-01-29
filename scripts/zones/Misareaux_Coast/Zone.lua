-----------------------------------
--
-- Zone: Misareaux_Coast (25)
--
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/helm")
require("scripts/globals/world")
local ID = require("scripts/zones/Misareaux_Coast/IDs")
local MISAREAUX_COAST = require("scripts/zones/Misareaux_Coast/globals")
-----------------------------------

function onInitialize(zone)
    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)
    MISAREAUX_COAST.ziphiusHandleQM()
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(567.624, -20, 280.775, 120)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onGameHour(zone)
    local Odqan = GetMobByID(16879737)
    local SpawnTimer = Odqan:getLocalVar("SpawnTimer")
    local Time = os.time()
    local vHour = VanadielHour()
    if vHour >= 22 or vHour <= 7 then
        MISAREAUX_COAST.ziphiusHandleQM()
    end
    if vHour >= 2 or vHour <= 8 and zone:getWeather() ~= GLOOM and zone:getWeather() ~= THUNDER and zone:getWeather() ~= WIND then
        -- Atomic Clusters
        SpawnMob(16879777)
        SpawnMob(16879833)
        SpawnMob(16879722)
    if not Odqan:isSpawned() and Time >= SpawnTimer then
        SpawnMob(Odqan)
        Odqan:setLocalVar("SpawnTimer", Time + 3200)
        end
    else
        DespawnMob(16879777)
        DespawnMob(16879833)
        DespawnMob(16879722)
        DespawnMob(Odqan)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
