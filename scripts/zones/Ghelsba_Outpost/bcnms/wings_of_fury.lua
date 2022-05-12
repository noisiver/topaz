-----------------------------------
-- Wings of Fury
-- Ghelsba Outpost BCNM20, Cloudy Orb
-- !additem cloudy_orb
-- !pos -165.357 -11.672 77.771 140
-----------------------------------
require("scripts/globals/battlefield")
local ID = require("scripts/zones/Ghelsba_Outpost/IDs")
-----------------------------------

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
end

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    local cloudyOrb = 1551
    player:delItem(cloudyOrb, 1)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 2, battlefield:getLocalVar("[cs]bit"), 2)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
