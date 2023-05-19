-----------------------------------
-- Area: Navukgo Execution Chamber
-- BCNM: PUP G5 Achieving True Power
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
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
    if csid == 32001 and player:getQuestStatus(BASTOK, tpz.quest.id.ACHIEVING_TRUE_POWER) == QUEST_ACCEPTED then
        npcUtil.completeQuest(player, BASTOK, tpz.quest.id.bastok.ACHIEVING_TRUE_POWER, {item=4181, title=tpz.title.MASTER_OF_MANIPULATION})
        player:levelCap(75)
        player:messageSpecial(ID.text.LEVEL_LIMIT_75)
    end
end