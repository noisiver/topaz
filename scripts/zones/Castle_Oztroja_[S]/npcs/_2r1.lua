-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: _2r1 (Brass Door)
-- Notes: F2 Lever Puzzle Dor
-- !gotoid 17183536
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    if npc:getAnimation() == tpz.anim.CLOSE_DOOR then
        player:messageSpecial(ID.text.ITS_LOCKED)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
