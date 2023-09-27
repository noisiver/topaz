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

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local escutcheonsStage = player:getCharVar("escutcheonsStage")
    for v = tpz.skill.WOODWORKING, tpz.skill.COOKING do
        if player:getSkillRank(v) >= 10 then -- Veteran or higher
        end
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
