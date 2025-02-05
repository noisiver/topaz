-----------------------------------
-- Area: Appolyon
-- Name: NW Apollyon
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Apollyon/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("randomF1", ID.mob.APOLLYON_NW_MOB[1]+math.random(1,7))
    battlefield:setLocalVar("loot", 1)
    SetServerVariable("[NW_Apollyon]Time", battlefield:getTimeLimit()/60)
    tpz.limbus.handleDoors(battlefield)
    tpz.limbus.setupArmouryCrates(battlefield:getID())
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[NW_Apollyon]Time", battlefield:getRemainingTime()/60)
    end
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(tpz.ki.COSMOCLEANSE)
    player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, tpz.ki.COSMOCLEANSE)
    player:delKeyItem(tpz.ki.RED_CARD)
    player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, tpz.ki.RED_CARD)
    player:setCharVar("Cosmo_Cleanse_TIME", os.time())
end

function onBattlefieldDestroy(battlefield)
    tpz.limbus.handleDoors(battlefield, true)
    SetServerVariable("[NW_Apollyon]Time", 0)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    player:messageSpecial(ID.text.HUM+1)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end