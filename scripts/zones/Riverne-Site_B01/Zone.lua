-----------------------------------
--
-- Zone: Riverne-Site_B01
--
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/conquest")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 268, 88, 858, 0, 0, 0) --Go! Go! Gobmuffin!
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(729.749, -20.319, 407.153, 90) -- {R}
    end
    return cs
end

function afterZoneIn(player)
    if (ENABLE_COP_ZONE_CAP == 1) then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, 50, 0, 0) -- LV50 cap
    end
end

function onRegionEnter(player, region)
    local RegionID = region:GetRegionID()

    -- Make sure player is not mid cutscene
    if (RegionID == 1) and (player:getStatus() ~= tpz.status.CUTSCENE_ONLY) then
        if (player:getCharVar("riverneMapQuest") > 0 and player:getCharVar("riverneMapQuest") < 4) then
            player:timer(10000, function(player)
                SetServerVariable("Gobmuffin", os.time() + 360)
                for v = 16896152, 16896154, 1 do
                    if not GetMobByID(v):isSpawned() then
                        SpawnMob(v):updateClaim(player)
                    end
                end
            end)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
