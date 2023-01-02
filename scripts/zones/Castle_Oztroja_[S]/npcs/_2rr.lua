-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: _2rr (Hint Handle)
-- !gotoid 17183533
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
-----------------------------------

function onTrigger(player, npc)
    player:messageSpecial(ID.text.PROBABLY_WORKS_WITH_SOMETHING_ELSE)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
