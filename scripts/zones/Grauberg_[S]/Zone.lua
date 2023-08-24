-----------------------------------
--
-- Zone: Grauberg_[S] (89)
--
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/status")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    tpz.helm.initZone(zone, tpz.helm.type.HARVESTING)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getCharVar("SeeingBloodRed_Instance") == 1 then
        player:setCharVar("SeeingBloodRed_Instance", 0)
        if player:getCharVar("SeeingBloodRed") == 4 then
            cs = 15
        else
            player:setPos(-277.011, -54.000, -101.048, 250)
        end
    elseif (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(495.063, 69.903, 924.102, 23)
    end
    
    return cs
end


function onZoneWeatherChange(weather)
    local npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS)
    if npc then
        npc:setStatus(tpz.status.NORMAL)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 15 then
        player:setPos(-277.011, -54.000, -101.048, 250)
    end
end

