-----------------------------------
-- Area: Talacca Cove
-- BCNM: COR G5 Breaking the Bonds of Fate
-- TODO: Entry requirements/leave/etc diff from our server
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Talacca_Cove/IDs")
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
    if player:hasKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER) then
        player:delKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, tpz.ki.SECRET_IMPERIAL_ORDER)
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

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 32001 and player:getQuestStatus(AHT_URHGAN, BREAKING_THE_BONDS_OF_FATE) == QUEST_ACCEPTED then
        npcUtil.completeQuest(player, AHT_URHGAN, BREAKING_THE_BONDS_OF_FATE, {item=4181, title=dsp.title.MASTER_OF_CHANCE})
        player:levelCap(75);
        player:messageSpecial(ID.text.LEVEL_LIMIT_75);
    end
end
