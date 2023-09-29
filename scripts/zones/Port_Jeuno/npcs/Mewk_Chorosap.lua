-----------------------------------
-- Area: Port Jeuno
--  NPC: Mewk Chorosap
-- Escutcheons NPC
-- !gotoid 17784999
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/items")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Port_Jeuno/IDs")
-----------------------------------
--tpz.items.PIECE_OF_JACARANDA_LUMBER, tpz.items.PIECE_OF_KAPOR_LUMBER
local questData =
{
    [tpz.skill.WOODWORKING] =
    {
        [1] = {
            RequestNumber = 4,
            ShieldItem = 100,
            Items = {
                { Id = tpz.items.PIECE_OF_JACARANDA_LUMBER, Quantity = 3 },
                { Id = tpz.items.PIECE_OF_KAPOR_LUMBER, Quantity = 4 },
                -- etc..
            },
        },
    }
}

local function AdvanceRequest(player)
    local currentShield = player:GetCharVar('ShieldCurrentSkillType');
    local shieldData = questData[currentShield];
    local currentStage = player:getCharVar('ShieldCurrentStage');
    if (currentStage == nil) then
        --Set up first request for first stage if no stage set.
        player:setCharVar('ShieldCurrentStage', 1);
        player:setCharVar('ShieldRequestsCompleted', 0);
        currentStage = 1;
    else
        --Increase number of requests completed if not..
        local requestsCompleted = player:getCharVar('ShieldRequestsCompleted') + 1;

        --If requests completed matches number of requests in stage, then advance to next stage..
        if (requestsCompleted >= shieldData[currentStage].RequestNumber) then
            currentStage = currentStage + 1;
            if currentStage > #shieldData then
                --All stages complete... do whatever.

                return;
            else
                --Go to next stage..
                currentStage = currentStage + 1;
                player:setCharVar('ShieldCurrentStage', currentStage);
                player:setCharVar('ShieldRequestsCompleted', 0);
            end
        else
            --Update number of requests completed..
            player:setCharVar('ShieldRequestsCompleted', requestsCompleted);
        end

    end

    local stageData = shieldData[currentStage];

    local selectedItem;
    while (selectedItem == nil) do
        local randomItem = stageData.Items[math.random(#stageData.Items)];

        --Find an item that has not yet been used and reset shield progress variables for it..
        if player:getCharVar('ShieldItemUsed_' .. tostring(randomItem.Id)) ~= 1 then
            player:setCharVar('ShieldStageItem', randomItem.Id);
            player:setCharVar('ShieldStageProgress', 0);
            player:setCharVar('ShieldStageMaximum', randomItem.Quantity);
            player:setCharVar('ShieldItemUsed_' .. tostring(randomItem.Id), 1);
            selectedItem = randomItem;
        end
    end

    --If you want to print message.. how do you get item name from Id..?
        
    local itemName = getname(selectedItem.Id);
    player:PrintToPlayer('My next request.. I will need you to bring me ' .. tostring(selectedItem.Quantity) .. ' ' .. itemName .. '.', 0, "Mewk");
end

local function checkTradeProgress(player, npc, trade)
    local requestedItem = player:getCharVar('ShieldStageItem');
    if npcUtil.tradeHas(trade, requestedItem) then


        local itemName = requestedItem:getName()
        local requestedQuantity = player:getCharVar('ShieldStageMaximum');
        local progress = player:getCharVar('ShieldStageProgress');
        local tradedAmount = trade:getItemQty(requestedItem);
        progress = progress + tradedAmount;
        player:tradeComplete();

        if (progress >= requestedQuantity) then
            -- Stage complete..
            player:PrintToPlayer("You have delivered all " .. requestedQuantity .. ' of my requested ' .. itemName .. '.  Great job!', 0, "Mewk");
            AdvanceRequest(player);
        else
            player:PrintToPlayer("You have delivered " .. progress .. ' out of ' .. requestedQuantity .. ' ' .. itemName .. '.', 0, "Mewk");
            player:setCharVar('ShieldStageProgress', progress);
        end
    end
end


function onTrade(player, npc, trade)
    checkTradeProgress(player, npc, trade)
end

function onTrigger(player, npc)
    local currentStage = player:getCharVar('ShieldCurrentStage');
    if (currentStage == 0) then
        for skill, data in pairs(questData) do
            if (player:getSkillRank(skill) >= 10) then
                player:setCharVar("ShieldCurrentSkillType", skill);
                player:PrintToPlayer("Hey you, you're a skilled crafter! I can make you even more skilled." ,0, "Mewk")
                AdvanceRequest(player);
                return;
            end
        end
        player:PrintToPlayer("I don't have time for unskilled adventurers." ,0, "Mewk")
    else
        local requestedItem = player:getCharVar('ShieldStageItem');
        local itemName = requestedItem:getName();
        local requestedQuantity = player:getCharVar('ShieldStageMaximum');
        local progress = player:getCharVar('ShieldStageProgress');
        if (progress < requestedQuantity) then
            player:PrintToPlayer("You have delivered " .. progress .. ' out of ' .. requestedQuantity .. ' ' .. itemName, tpz.msg.textColor.HIDDEN, 0);
        else
            -- TODO: Stage is complete but not turned in, idk?
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end



function checkTrade(player, npc, trade, requestedItem, quantity, stage, nextItem, nextQuantity, var)
    if npcUtil.tradeHasExactly(trade, {requestedItem, quantity } ) then
        player:setCharVar("escutcheonsStage", stage + 1)
        player:tradeComplete()
        player:PrintToPlayer("Great job! Now I require " .. nextItem .. " x " .. nextQuantity ,0, "Mewk")
    end
end

function waitingMessage(player, npc, requestedItem, quantity)
    player:PrintToPlayer("I am still waiting for " .. requestedItem:getName() .. " " .. quantity ,0, "Mewk")
end
