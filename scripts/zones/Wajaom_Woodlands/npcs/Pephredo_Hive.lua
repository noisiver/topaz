-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Pephredo Hive
--  IDs: 16986714 - 16986724
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- 15% chance to get a random around(2-5) Pephredo Hive Chips from each hive
    if npc:getID() > 16986713 and npc:getID() < 16986725 then
        if os.time() >= GetServerVariable("Hive" .. npc:getID()) then
            if math.random(1,100) <= 25 then
                player:messageSpecial(ID.text.ITEM_OBTAINED, 2164) -- Pephredo Hive Chip
                player:addItem(2164, math.random(5, 15))
            else
                player:PrintToPlayer("You don't find anything. Try again later.",0,"???")
            end
            SetServerVariable("Hive" .. npc:getID(), os.time() + 1800) -- 30 minutes between attempts
        else
            player:messageSpecial(ID.text.NOTHING_HAPPENS)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
