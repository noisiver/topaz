-----------------------------------
-- Instance: Seagull Grounded
--  NPC: JK1
-- Notes: Door I-6 (Entrance)
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
