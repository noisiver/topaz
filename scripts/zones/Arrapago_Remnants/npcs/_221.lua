
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/salvage")
require("scripts/globals/npc_util")
require("scripts/globals/items")

function onTrigger(entity, npc)
    if npc:getAnimation() == 8 then
        npc:untargetable(true)
    else
        entity:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

function onTrade(player, npc, trade)
    local instance = player:getInstance()

    if npcUtil.tradeHas(trade, tpz.items.ARRAPAGO_CARD, true) then
        npc:getEntity(bit.band(ID.npc[1][3].DOOR4, 0xFFF), tpz.objType.NPC):setAnimation(8)
        salvageUtil.msgGroup(player, "The door opens!", 0xD, none)
        instance:setProgress(4) -- TODO: Test
        npc:untargetable(true)
        player:tradeComplete()
    else
        player:PrintToPlayer("*Error* Invalid.",0xD, none)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(entity, eventid, result, door)
end
