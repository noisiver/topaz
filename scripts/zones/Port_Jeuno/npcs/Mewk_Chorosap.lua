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
local questData =
{
    [tpz.skill.WOODWORKING] = { tpz.items.PIECE_OF_JACARANDA_LUMBER, tpz.items.PIECE_OF_KAPOR_LUMBER },
    [tpz.skill.SMITHING] = {},
    [tpz.skill.GOLDSMITHING] = {},
    [tpz.skill.CLOTHCRAFT] = {},
    [tpz.skill.LEATHERCRAFT] = {},
    [tpz.skill.BONECRAFT] = {},
    [tpz.skill.ALCHEMY] = {},
    [tpz.skill.COOKING] = {}
}
function onTrade(player, npc, trade)
    local escutcheonsStage = player:getCharVar("escutcheonsStage")
    for v = tpz.skill.WOODWORKING, tpz.skill.COOKING do
        local currentSkill = questData[v]
        if player:getSkillRank(v) >= 10 then -- Veteran or higher
            if (escutcheonsStage == 1) then
                local requestedItem = currentSkill[1]
                local quantity = 100
                local stage = 1
                local nextQuantity = 100
                checkTrade(player, npc, trade, requestedItem, quantity, stage, currentSkill[2], nextQuantity)
            elseif (escutcheonsStage == 2) then
                local requestedItem = currentSkill[2]
                local quantity = 100
                local stage = 2
                local nextQuantity = 100
                checkTrade(player, npc, trade, requestedItem, quantity, stage, currentSkill[3], nextQuantity)
            elseif (escutcheonsStage == 3) then
                local requestedItem = currentSkill[3]
                local quantity = 100
                local stage = 3
                local nextQuantity = 100
                checkTrade(player, npc, trade, requestedItem, quantity, stage, currentSkill[4], nextQuantity)
            elseif (escutcheonsStage == 4) then
                if npcUtil.tradeHasExactly(trade, {currentSkill[4], 100} ) then
                    if npcUtil.giveItem(player, itemList.reward[1]) then
                        player:tradeComplete()
                        player:PrintToPlayer("Congratluations! You're finally done! Here's your fully completed Escutcheons!" ,0, "Mewk")
                    end
                end
            end
        end
    end
end

function onTrigger(player, npc)
    local escutcheonsStage = player:getCharVar("escutcheonsStage")
    for v = tpz.skill.WOODWORKING, tpz.skill.COOKING do
        local currentSkill = questData[v]
        if player:getSkillRank(v) >= 10 then -- Veteran or higher
            if (escutcheonsStage == 0) then -- Begin the Escutcheon quest
                local requestedItem = currentSkill[1]
                player:setCharVar("escutcheonsStage", 1)
                player:PrintToPlayer("Hey you, you're a skilled crafter! I can make you even more skilled." ,0, "Mewk")
                player:PrintToPlayer("First, bring me " .. requestedItem:getName() .. " x100" ,0, "Mewk")
            elseif (escutcheonsStage == 1) then
                local requestedItem = currentSkill[1]
                waitingMessage(player, npc, requestedItem, "100")
            elseif (escutcheonsStage == 2) then
            elseif (escutcheonsStage == 3) then
            elseif (escutcheonsStage == 4) then
            end
        else
            player:PrintToPlayer("I don't have time for unskilled adventurers." ,0, "Mewk")
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

function checkTrade(player, npc, trade, requestedItem, quantity, stage, nextItem, nextQuantity)
    if npcUtil.tradeHasExactly(trade, {requestedItem, quantity } ) then
        player:setCharVar("escutcheonsStage", stage + 1)
        player:tradeComplete()
        player:PrintToPlayer("Great job! Now I require " .. nextItem .. " x " .. nextQuantity ,0, "Mewk")
    end
end

function waitingMessage(player, npc, requestedItem, quantity)
    player:PrintToPlayer("I am still waiting for " .. requestedItem:getName() .. " " .. quantity ,0, "Mewk")
end