-----------------------------------
-- Area:  Castle Oztroja [S]
-- NPC:   _2rh (Handle)
-- Notes: Opens door _2r1
-- !gotoid 17183540
-----------------------------------
local CASTLE_OZTROJA_S = require("scripts/zones/Castle_Oztroja_[S]/globals")

function onTrigger(player, npc)
    CASTLE_OZTROJA_S.handleOnTrigger(npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
