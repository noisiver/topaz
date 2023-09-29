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
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.SMITHING] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.GOLDSMITHING] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.CLOTHCRAFT] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.LEATHERCRAFT] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.BONECRAFT] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.ALCHEMY] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    },
    [tpz.skill.COOKING] =
    {
        stage1 = { items = {}, quantity = {}, vars = {} },
        stage2 = { items = {}, quantity = {}, vars = {} },
        stage3 = { items = {}, quantity = {}, vars = {} },
        stage4 = { items = {}, quantity = {}, vars = {} },
    }
}
function onTrade(player, npc, trade)
    local escutcheonsStage = player:getCharVar("escutcheonsStage")
    for v = tpz.skill.WOODWORKING, tpz.skill.COOKING do
        local currentSkill = questData[v]
        if player:getSkillRank(v) >= 10 then -- Veteran or higher
            if (escutcheonsStage == 1) then
                local requestedItem = currentSkill.stage1.items[1]
                local stage = 1
                local questEntry = questData[currentSkill]
                local stage1Data = questEntry.stage1
                local itemList = stage1Data.items

                for _,entry in ipairs(itemList) do
                    checkTradeProgress(player, npc, trade, requestedItem, currentSkill.stage1.quantity[1], stage, currentSkill.stage2.items[1], nextQuantity, currentSkill.stage1.vars[1])
                end
            elseif (escutcheonsStage == 2) then
                local requestedItem = currentSkill[2]
                local stage = 2
                checkTradeProgress(player, npc, trade, requestedItem, quantity, stage, currentSkill[3], nextQuantity, var)
            elseif (escutcheonsStage == 3) then
                local requestedItem = currentSkill[3]
                local stage = 3
                checkTradeProgress(player, npc, trade, requestedItem, quantity, stage, currentSkill[4], nextQuantity, var)
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

function checkTradeProgress(player, npc, trade, requestedItem, quantity, stage, nextItem, nextQuantity, var)
    if npcUtil.tradeHas(trade, requestedItem ) then
        local currentAmount = player:getCharVar(var)
        local tradedAmount = trade:getItemQty(requestedItem)
        player:setCharVar(var, currentAmount + tradedAmount)
        player:tradeComplete()
        -- Display the amount of items traded and how many total need to be traded to the player (i.e. 30/75)
        player:PrintToPlayer("You have traded me" ..  player:getCharVar(var) .. "/" .. quantity ,0, "Mewk")

        -- If the amount total traded adds up to equal or above the amount required then add to overall stage progress
        local stageProgress = player:getCharVar(stage .. "Progress")
        if (player:getCharVar(var) >= quantity) then
            player:setCharVar(stage .. "Progress", stageProgress + 1)
            player:PrintToPlayer("You have completed" ..  player:getCharVar(stage .. "Progress") .. "/4 requests of this stage." ,0, "Mewk")
       end

        -- If stage progress is 4/4, then start the next stage
        if (player:getCharVar(stage .. "Progress") >= 4) then
        player:PrintToPlayer("Great job! Now I require " .. nextItem .. " x " .. nextQuantity ,0, "Mewk")
    end
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