-----------------------------------
-- Area: Western Altepa Desert
--  NPC: _3h0 (Altepa Gate)
-- !pos -19 12 131 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    npc:setAnimation(tpz.anim.OPEN_DOOR)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
