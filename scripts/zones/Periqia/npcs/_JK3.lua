-----------------------------------
-- Instance: Seagull Grounded
--  NPC: _JK3
-- Notes: Door G-11 (Before Final Fight)
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.TRIPLE_DOT)

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
