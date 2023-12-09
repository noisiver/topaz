-----------------------------------
-- Tango with a tracker
-- Boneyard Gully ENM, Letter from Shikaree X
-- !addkeyitem LETTER_FROM_SHIKAREE_X
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
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
        npcUtil.deleteKeyItem(player, tpz.ki.LETTER_FROM_SHIKAREE_X)
        player:addExp(2000)
        npcUtil.completeQuest(player, OTHER_AREAS_LOG, tpz.quest.id.otherAreas.TANGO_WITH_A_TRACKER, {
            var = "tangoWithTracker",
        })
    end
end
