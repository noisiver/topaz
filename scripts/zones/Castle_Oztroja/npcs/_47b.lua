-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47b (Handle)
-- Notes: Opens Trap Door (_47a) or Brass Door (_470)
-- !pos 22.310 -1.087 -14.320 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    local X = player:getXPos()
    local Z = player:getZPos()
    local trapDoor  = GetNPCByID(npc:getID() - 1)
    local brassDoor = GetNPCByID(npc:getID() - 2)

    if X < 21.6 and X > 18 and Z > -15.6 and Z < -12.4 then
        if VanadielDayOfTheYear() % 2 == 1 then
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
            if player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and player:getCharVar("MissionStatus") == 3 then
                player:startEvent(43)
            end
        end
    else
        player:messageSpecial(ID.text.CANNOT_REACH_TARGET)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 43 then
        player:setCharVar("MissionStatus", 4)
    end
end
