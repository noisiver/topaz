-----------------------------------
-- Bugard in the Clouds
-- Monarch Linn
-- !addkeyitem 674
-- BCNM ID 964
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
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
    local ID = zones[player:getZoneID()]
    if player:hasKeyItem(tpz.ki.MONARCH_BEARD) then
        player:delKeyItem(tpz.ki.MONARCH_BEARD)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, MONARCH_BEARD)
    end
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:addExp(2500)
    end
end
