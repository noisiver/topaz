-----------------------------------
-- Follow The White Rabbit
-- Bearclaw Pinnacle ENM, Zephyr Fan
-- !addkeyitem ZEPHYR_FAN
-----------------------------------
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
-----------------------------------

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("RandomRabit", math.random(16801797, 16801801)) -- Rabbit that despawns all other Leveret on death
end

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    if player:hasKeyItem(tpz.ki.ZEPHYR_FAN) then
        player:delKeyItem(tpz.ki.ZEPHYR_FAN)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, tpz.ki.ZEPHYR_FAN)
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
