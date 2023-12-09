-----------------------------------
--
-- Zone: VeLugannon_Palace (177)
--
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
-----------------------------------

function onInitialize(zone)
    tpz.treasure.initZone(zone)
    local monolithTable =
    {
        17502624, 17502626, 17502628, 17502630, 17502632,
        17502634, 17502636, 17502638, 17502640, 17502642
    }
    -- Randomize gates
    for _, monolith in pairs(monolithTable) do
        GetNPCByID(monolith):setAnimation(math.random(tpz.anim.OPEN_DOOR, tpz.anim.CLOSE_DOOR))
    end
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-100.01, -25.752, -399.468, 59)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
