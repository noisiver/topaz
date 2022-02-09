-----------------------------------
-- Area: Nashmau
--  NPC: Kilusha
-- Standard Info NPC
-- Trade EXACTLY 180k gil to get a lamp
-----------------------------------
require("scripts/globals/einherjar")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if player:getCharVar("EinherjarStatus") > 0 and not player:hasItem(einherjar.SMOULDERING_LAMP) and npcUtil.tradeHasExactly(trade, { { "gil", einherjar.LAMP_COST } }) then
        player:startEvent(25)
    end
end

function onTrigger(player,npc)
    if player:getCharVar("EinherjarStatus") == 0 then
        player:startEvent(23, einherjar.LAMP_COST, 3, 1, 205, 10, 27, 27, 0)
    else
        player:startEvent(24, einherjar.LAMP_COST, 0, 0, 0, 0, 0, 0, player:getCurrency("therion_ichor"))
    end
end

function onEventUpdate(player,csid,option)
    if csid == 24 then
        player:updateEvent(53, einherjar.RESERVATION_CANCEL, einherjar.KO_TIMEOUT, einherjar.REENTRY_HOURS, 0, 0, einherjar.SMOULDERING_LAMP, einherjar.GLOWING_LAMP)
    end
end

function onEventFinish(player,csid,option)
    if csid == 23 then
        player:setCharVar("EinherjarStatus", 1)
    elseif csid == 24 and option ~= 0 and option ~= 1073741824 then
        local item = einherjar.REWARDS[option]
        local ichor = player:getCurrency("therion_ichor")
        if item and ichor >= item[2] and npcUtil.giveItem(player, item[1]) then
            player:delCurrency("therion_ichor", item[2])
        end
    elseif csid == 25 and npcUtil.giveItem(player, einherjar.SMOULDERING_LAMP) then
        player:tradeComplete()
    end
end
