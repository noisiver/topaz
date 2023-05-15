-----------------------------------
-- Area: Talacca Cove
-- BCNM: PUP AF3 Puppetmaster Blues
-- TODO: Entry requirements/leave/etc diff from our server
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    local ID = zones[player:getZoneID()]
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:getCharVar("PuppetmasterBluesProgress") == 3 then
        player:setCharVar("PuppetmasterBluesProgress", 4)
    end
end
