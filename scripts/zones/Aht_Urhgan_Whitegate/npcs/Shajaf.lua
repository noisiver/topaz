-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Shajaf
-- Standard Info NPC
-----------------------------------

require("scripts/globals/common")
require("scripts/globals/npc_util")
require("scripts/globals/missions")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:hasKeyItem(tpz.ki.CONFIDENTIAL_IMPERIAL_ORDER) or player:hasKeyItem(tpz.ki.SECRET_IMPERIAL_ORDER) then
        player:startEvent(161)
    elseif player:getCharVar("next_isnm_order") > os.time() then
        player:startEvent(163)
    else
        player:startEvent(160, player:getCurrency("imperial_standing"))
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if option == 1 then
        npcUtil.giveKeyItem(player, tpz.ki.CONFIDENTIAL_IMPERIAL_ORDER)
        player:delCurrency("imperial_standing", 2000)
        player:setCharVar("next_isnm_order", getMidnight())
    elseif option == 2 then
        npcUtil.giveKeyItem(player, tpz.ki.SECRET_IMPERIAL_ORDER)
        player:delCurrency("imperial_standing", 3000)
        player:setCharVar("next_isnm_order", getMidnight())
    end
end