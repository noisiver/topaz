-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Dhima Polevhia
-- Standard Info NPC
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------

function onTrade(player,npc,trade)
    local PuppetmasterBlues = player:getQuestStatus(AHT_URHGAN, PUPPETMASTER_BLUES)
    local Count = trade:getItemCount()
    local Body = player:getCharVar("PuppetmasterBluesAFBody")
    local Gloves = player:getCharVar("PuppetmasterBluesAFGloves")
    local waiting = player:getCharVar("PuppetmasterBluesAFWait")

    if PuppetmasterBlues ~= QUEST_AVAILABLE and waiting == 0 then
        local successVar = ""
        -- printf("%s %s %s", player:hasItem(15686), player:getCharVar("PuppetmasterBluesAFBoots") == 1, npcUtil.tradeHas(trade, {786, 2289, 2152, 754, {2186, 2}}))
        if not player:hasItem(15686) and player:getCharVar("PuppetmasterBluesAFBoots") == 0 and npcUtil.tradeHas(trade, {786, 2289, 2152, 754, {2186, 2}}) then
            successVar = "PuppetmasterBluesAFBoots"
        elseif not player:hasItem(14930) and player:getCharVar("PuppetmasterBluesAFGloves") == 0 and npcUtil.tradeHas(trade, {821, 2289, 2152, 754, 2186}) then
            successVar = "PuppetmasterBluesAFGloves"
        elseif not player:hasItem(14523) and player:getCharVar("PuppetmasterBluesAFBody") == 0 and npcUtil.tradeHas(trade, {786, 2289, 1636, 1699, 2187}) then
            successVar = "PuppetmasterBluesAFBody"
        end

        if successVar ~= "" then
            player:startEvent(795)
            player:tradeComplete()
            player:setCharVar(successVar, 1)
            player:setCharVar("PuppetmasterBluesAFWait", VanadielDayOfTheYear())
        end
    end
end

function onTrigger(player,npc)
    local PuppetmasterBlues = player:getQuestStatus(AHT_URHGAN,PUPPETMASTER_BLUES)
    if PuppetmasterBlues ~= QUEST_AVAILABLE then
        local previousDay = player:getCharVar("PuppetmasterBluesAFWait")
        local currentDay = VanadielDayOfTheYear()
        local PuppetmasterBluesGear = player:getCharVar("PuppetmasterBluesGear")

        -- One game day wait between AF pieces
        if previousDay > 0 and previousDay <= currentDay then
            player:startEvent(792)
        elseif previousDay ~= currentDay then
            player:startEvent(796)
        elseif PuppetmasterBluesGear >= 3 then
            player:startEvent(793)
        elseif PuppetmasterBluesGear >= 1 then
            player:startEvent(791)
        elseif PuppetmasterBluesGear == 0 then
            player:startEvent(789)
        end
    else
        player:startEvent(788)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 792 then
        local successVar = ""
        if player:getCharVar("PuppetmasterBluesAFBody") == 1 and npcUtil.giveItem(player, 14523) then
            successVar = "PuppetmasterBluesAFBody"
        elseif player:getCharVar("PuppetmasterBluesAFGloves") == 1 and npcUtil.giveItem(player, 14930) then
            successVar = "PuppetmasterBluesAFGloves"
        elseif player:getCharVar("PuppetmasterBluesAFBoots") == 1 and npcUtil.giveItem(player, 15686) then
            successVar = "PuppetmasterBluesAFBoots"
        end

        if successVar ~= "" then
            player:setCharVar(successVar, 0)
            player:setCharVar("PuppetmasterBluesAFWait", 0)
            player:addVar("PuppetmasterBluesGear", 1)
        end
    end
end
