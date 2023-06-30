-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC: Venessa
-- Promyvion ENM NPC
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
-----------------------------------

local rewards = {
    { 1790, 14674}, -- Impetuous Vision
    { 1791, 15431}, -- Tenuous Vision
    { 1792, 15463}, -- Snide Vision
    { 1793,  1765}, -- Grave Image
    { 1794,  1766}, -- Beatific Image
    { 1795,  1768}, -- Valorous Image
    { 1796,  1770}, -- Ancient Image
    { 1797,  1772}, -- Virgin Image
    { 1798,  14767}, -- vernal_vision 
    { 1799,  14768}, -- punctilious_vision 
    { 1800,  14769}, -- violent_vision 
    { 1801,  14770}, -- solemn_vision 
    { 1802,  14771}, -- audacious_vision 
    { 1803,  14772}, -- painful_vision 
    { 1804,  14773}, -- valiant_vision 
    { 1805,  14774}, -- timorous_vision 
    { 1806,  14775}, -- pretentious_vision 
    { 1807,  14776}, -- vivid_vision 
    { 1808,  14777}, -- brilliant_vision 
    { 1809,  14778}, -- malicious_vision 
    { 1810,  14779}, -- endearing_vision 
    { 1811,  14780}, -- venerable_vision 
    { 1812,  14781}, -- pristine_vision 
}

function onTrade(player, npc, trade)
    local count = trade:getItemCount()
    local reward = 0

    -- Get what reward should be given according to traded item
    for i,prize in pairs(rewards) do
        if trade:hasItemQty(prize[1], 1) and count == 1 then
            reward = prize[2]
            player:setCharVar("venereward", reward)
            player:startEvent(10066, reward)
        end
    end
end

function onTrigger(player, npc)
    -- Player has finished the ENM at least once
    if player:getCurrentMission(COP) > tpz.mission.id.cop.THE_RITES_OF_LIFE and player:getCharVar("[ENM]VenessaIntro") == 1 then
        player:startEvent(10065)
    -- Player can do ENM but hasn't done it
    elseif player:getCurrentMission(COP) > tpz.mission.id.cop.THE_RITES_OF_LIFE then
        player:startEvent(10064)
    -- Player has not progressed far enough in CoP
    else
        player:startEvent(10064, 99)
    end
end

function onEventUpdate(player, csid, option)
    local abandonmentTimer = player:getCharVar("[ENM]abandonmentTimer")
    local antipathyTimer = player:getCharVar("[ENM]antipathyTimer")
    local animusTimer = player:getCharVar("[ENM]animusTimer")
    local acrimonyTimer = player:getCharVar("[ENM]acrimonyTimer")

    if csid == 10064 or csid == 10065 then
        -- Spit out time remaining on KI
        if option == 1 and VanadielTime() < abandonmentTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ABANDONMENT) == false then
            player:updateEvent(1, 0, 0, 0, abandonmentTimer, 1, 0, 0)
        elseif option == 2 and VanadielTime() < antipathyTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ANTIPATHY) == false  then
            player:updateEvent(2, 0, 0, 0, antipathyTimer, 1, 0, 0)
        elseif option == 3 and VanadielTime() < animusTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ANIMUS) == false then
            player:updateEvent(3, 0, 0, 0, animusTimer, 1, 0, 0)
        elseif option == 4 and VanadielTime() < acrimonyTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ACRIMONY) == false then
            player:updateEvent(4, 0, 0, 0, acrimonyTimer, 1, 0, 0)
        end

        -- Give player KI
        if option == 1 and VanadielTime() >= abandonmentTimer then
            player:updateEvent(1, 0, 0, 1)
        elseif option == 2 and VanadielTime() >= antipathyTimer then
            player:updateEvent(2, 0, 0, 1)
        elseif option == 3 and VanadielTime() >= animusTimer then
            player:updateEvent(3, 0, 0, 1)
        elseif option == 4 and VanadielTime() >= acrimonyTimer then
            player:updateEvent(4, 0, 0, 1)
        end
    end
end

function onEventFinish(player, csid, option)
    -- Give player reward
    local objecttrade = player:getCharVar("venereward")
    if csid == 10066 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, objecttrade)
        else
            player:tradeComplete()
            player:addItem(objecttrade)
            player:messageSpecial(ID.text.ITEM_OBTAINED, objecttrade)
            player:setCharVar("venereward", 0)
        end
    end

    local abandonmentTimer = player:getCharVar("[ENM]abandonmentTimer")
    local antipathyTimer = player:getCharVar("[ENM]antipathyTimer")
    local animusTimer = player:getCharVar("[ENM]animusTimer")
    local acrimonyTimer = player:getCharVar("[ENM]acrimonyTimer")

    -- Give player KI
    if csid == 10065 or csid == 10064 then
        if option == 1 and VanadielTime() >= abandonmentTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ABANDONMENT) == false then
            player:addKeyItem(tpz.ki.CENSER_OF_ABANDONMENT)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CENSER_OF_ABANDONMENT)
            player:setCharVar("[ENM]abandonmentTimer", os.time() + 432000) -- 5 days
            player:setCharVar("[ENM]VenessaIntro", 1)
        elseif option == 2 and VanadielTime() >= antipathyTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ANTIPATHY) == false then
            player:addKeyItem(tpz.ki.CENSER_OF_ANTIPATHY)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CENSER_OF_ANTIPATHY)
            player:setCharVar("[ENM]antipathyTimer", os.time() + 432000) -- 5 days
            player:setCharVar("[ENM]VenessaIntro", 1)
        elseif option == 3 and VanadielTime() >= animusTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ANIMUS) == false then
            player:addKeyItem(tpz.ki.CENSER_OF_ANIMUS)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CENSER_OF_ANIMUS)
            player:setCharVar("[ENM]animusTimer", os.time() + 432000) -- 5 days
            player:setCharVar("[ENM]VenessaIntro", 1)
        elseif option == 4 and VanadielTime() >= acrimonyTimer and player:hasKeyItem(tpz.ki.CENSER_OF_ACRIMONY) == false then
            player:addKeyItem(tpz.ki.CENSER_OF_ACRIMONY)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CENSER_OF_ACRIMONY)
            player:setCharVar("[ENM]acrimonyTimer", os.time() + 432000) -- 5 days
             player:setCharVar("[ENM]VenessaIntro", 1)
        end
    end
end
