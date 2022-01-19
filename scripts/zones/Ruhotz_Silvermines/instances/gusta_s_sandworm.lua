-----------------------------------
-- Ruhotz Silvermines Instance [Guivre, Lambton Worm]
-- Doomvoid from North Gustaberg [S]
-----------------------------------
require("scripts/globals/instance")
local ID = require("scripts/zones/Ruhotz_Silvermines/IDs")
-----------------------------------

function afterInstanceRegister(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

function onInstanceCreated(instance)
    local random = 0
    random = math.random(10)
        
    if (random <=7) then
    SpawnMob(ID.mob.GUIVRE, instance)
    end
    if (random >=8) then
    SpawnMob(ID.mob.LAMBTON_WORM, instance)
    end
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)

    local chars = instance:getChars()
    for i, v in pairs(chars) do
        v:startEvent(10001)
    end
end

function onInstanceProgressUpdate(instance, progress)
end

function onInstanceComplete(instance)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
