-----------------------------------
--
-- Zone: Leujaoam_Sanctum
--
-----------------------------------
local ID = require("scripts/zones/Leujaoam_Sanctum/IDs")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
end

function onInstanceZoneIn(player, instance)
    local cs = -1
    local pos = player:getPos()

    if pos.x == 0 and pos.y == 0 and pos.z == 0 then
        local entrypos = instance:getEntryPos()
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot)
    end

    if player:getInstance() ~= nil then
        player:setCharVar("assaultEntered", 1)
    end

    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    assaultOnEventFinish(player, csid, 102, tpz.zone.CAEDARVA_MIRE)
end

function onInstanceLoadFailed()
    return tpz.zone.CAEDARVA_MIRE
end
