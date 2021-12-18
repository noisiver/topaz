-----------------------------------
--
-- Zone: Phomiuna_Aqueducts (27)
--
-----------------------------------
local ID = require("scripts/zones/Phomiuna_Aqueducts/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    if math.random(2) == 1 then
        DisallowRespawn(ID.mob.EBA, true)
        DisallowRespawn(ID.mob.MAHISHA, false)
        UpdateNMSpawnPoint(ID.mob.MAHISHA)
        GetMobByID(ID.mob.MAHISHA):setRespawnTime(900) 
    else
        DisallowRespawn(ID.mob.MAHISHA, true)
        DisallowRespawn(ID.mob.EBA, false)
        UpdateNMSpawnPoint(ID.mob.EBA)
        GetMobByID(ID.mob.EBA):setRespawnTime(900) 
    end
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(260.02, -2.12, -290.461, 192)
    end

    return cs
end

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, 40, 0, 0) -- LV40 cap
    end
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
