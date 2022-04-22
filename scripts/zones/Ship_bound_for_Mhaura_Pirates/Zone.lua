-----------------------------------
--
-- Zone: Ship_bound_for_Mhaura_Pirates (228)
--
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Mhaura_Pirates/IDs")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    -- Play pirate music(Changes when day/night cycle happens)
    for _, player in pairs(zone:getPlayers()) do
        player:ChangeMusic(0, 170)
        player:ChangeMusic(1, 170)
    end
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        local position = math.random(-2, 2) + 0.150
        player:setPos(position, -2.100, 3.250, 64)
    end

    -- Play pirate music(Changes when day/night cycle happens)
    player:ChangeMusic(0, 170)
    player:ChangeMusic(1, 170)

    return cs
end

function onTransportEvent(player, transport)
    player:startEvent(512)
    player:messageSpecial(ID.text.DOCKING_IN_MHAURA)
end

function onGameHour(zone)
    local vHour = VanadielHour()
    -- Play pirate music(Changes when day/night cycle happens)
    if vHour > 0 then
        for _, player in pairs(zone:getPlayers()) do
            player:ChangeMusic(0, 170)
            player:ChangeMusic(1, 170)
        end
    end
    if VanadielHour() % 1 == 0 then
        for _, player in pairs(zone:getPlayers()) do
            player:ChangeMusic(0, 170)
            player:ChangeMusic(1, 170)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 512 then
        player:setPos(0, 0, 0, 0, tpz.zone.MHAURA)
    end
end
