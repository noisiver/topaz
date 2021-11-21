-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Furnace_Hatch
-----------------------------------
local ID = require("scripts/zones/Newton_Movalpolos/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------
local gates =
{
    ['blue'] = { 16826582, 16826584, 16826587, 16826589, 16826590, 16826592 },
    ['red'] = { 16826583, 16826585, 16826586, 16826588, 16826591, 16826593 },
}

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 947)) then
        player:confirmTrade();
        player:tradeComplete()
        player:startEvent(21 + npc:getID() - ID.npc.FURNACE_HATCH_OFFSET); -- THUD!
    else
        player:startEvent(20); -- no firesand message
    end
end;

function onTrigger(player,npc)
    player:startEvent(20); -- no firesand message
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if csid ~= 20 then
        player:messageSpecial(ID.text.ITEM_EXPLODES, 947)
        local blueOpen = GetNPCByID(ID.npc.DOOR_OFFSET):getAnimation() == tpz.anim.OPEN_DOOR
        for _, door in ipairs((blueOpen and gates.blue) or gates.red) do
            GetNPCByID(door):setAnimation(tpz.anim.CLOSE_DOOR)
        end
        for _, door in ipairs((blueOpen and gates.red) or gates.blue) do
            GetNPCByID(door):setAnimation(tpz.anim.OPEN_DOOR)
        end
    end
end;

