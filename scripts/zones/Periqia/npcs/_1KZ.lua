-----------------------------------
-- Instance: Seagull Grounded
--  NPC: _1KZ
-- Notes: Door I-9
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
