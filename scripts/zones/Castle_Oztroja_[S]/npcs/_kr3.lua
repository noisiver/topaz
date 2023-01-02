-----------------------------------
-- Area: Castle Oztroja [S]
--  NPC: kr5 (Torch Stand)
-- Notes: Opens door brass door when any torch is lit
-- !pos -60 -72 -139 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja_[S]/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrigger(player, npc)
    local brassDoor = GetNPCByID(17183556)

    if npc:getAnimation() == tpz.anim.CLOSE_DOOR and brassDoor:getAnimation() == tpz.anim.CLOSE_DOOR then
        player:startEvent(12)
    else
        player:messageSpecial(ID.text.TORCH_LIT)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if option == 1 then
        local brassDoor = GetNPCByID(17183556)
        if brassDoor:getAnimation() == tpz.anim.CLOSE_DOOR then
            brassDoor:openDoor(33)
            for i = 2, 5 do
                local torch = GetNPCByID(17183556 + i)
                torch:setAnimation(tpz.anim.CLOSE_DOOR)
                torch:openDoor(33)
            end
        else
            GetNPCByID(17183556 + 2):openDoor()
        end
    end
end
