-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: _2rb (Handle)
-- Notes: Opens Trap Brass Door on F1
-- !gotoid 17183516
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local X = player:getXPos()
    local Z = player:getZPos()
    local trapDoor  = GetNPCByID(npc:getID() - 2)
    local brassDoor = GetNPCByID(npc:getID() - 3)

    if X < 21.6 and X > 18 and Z > -15.6 and Z < -12.4 then
        if VanadielDayOfTheYear() % 2 == 0 then
            if brassDoor:getAnimation() == tpz.anim.CLOSE_DOOR and npc:getAnimation() == tpz.anim.CLOSE_DOOR then
                npc:openDoor(8)
                player:timer(2000, function(player)
                    brassDoor:openDoor(6)
                end)
            end
        else
            if trapDoor:getAnimation() == tpz.anim.CLOSE_DOOR and npc:getAnimation() == tpz.anim.CLOSE_DOOR then
                npc:openDoor(8)
                player:timer(2000, function(player)
                    trapDoor:openDoor(6)
                end)
            end
        end
    else
        player:messageSpecial(ID.text.CANNOT_REACH_TARGET)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
