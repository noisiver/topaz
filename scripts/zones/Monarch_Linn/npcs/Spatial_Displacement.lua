-----------------------------------
-- Area: Monarch_Linn
-- NPC:  Spatial Displacement
-- !pos -35 -1 -539 31
-----------------------------------
local ID = require("scripts/zones/Monarch_Linn/IDs")
require("scripts/globals/bcnm")
require("scripts/globals/quests")
require("scripts/globals/missions")
require("scripts/globals/zone")
-----------------------------------

function onTrade(player, npc, trade)

    if (TradeBCNM(player, npc, trade)) then
        return
    end
end

function onTrigger(player, npc)
    EventTriggerBCNM(player, npc)
end

function onEventUpdate(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

function onEventFinish(player, csid, option)
    if (csid == 11 and option == 1) then
        player:setPos(-508.582, -8.471, -387.670, 92, 30) -- To Riv Site A (Retail confirmed)
    elseif (csid == 10 and option == 1) then
        player:setPos(-533.690, -20.5, 503.656, 224, 29) -- To Riv Site B (Retail confirmed)
    elseif (csid == 7 and option ==1) then
        player:setPos(-538.526, -29.5, 359.219, 255, 25) -- back to Misareaux Coast (Retail confirmed)
    elseif (EventFinishBCNM(player, csid, option)) then
        return
    end
end
