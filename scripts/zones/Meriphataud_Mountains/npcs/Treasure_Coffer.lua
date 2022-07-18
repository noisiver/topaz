-----------------------------------
-- Area: Golden Salvage(Ilrusi Atoll)
-- NPC:  Cursed Chest
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/moblinmazemongers")
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
-----------------------------------
    local ItemList =
    {
        [1] = 5431,
        [2] = 5432,
        [3] = 5433,
        [4] = 5824,
        [5] = 5825,
        [6] = 5827,
        [7] = 5828,
        [8] = 5830,
        [9] = 5832,
        [10] = 5839,
        [11] = 5841,
        [12] = 5392,
        [13] = 5393,
        [14] = 5395,
        [15] = 5390,
        [16] = 5394,
        [17] = 5851,
        [18] = 5440,
    }

function onTrade(player,npc,trade)
    --if npc:getID() == 17002776 then
        --npc:setPos(341.5745,-15.7312,-194.2174, 160)
    --end
end

function onTrigger(player, npc)
    local instance = npc:getInstance()
	local Message = npc:getLocalVar("Message")
    if Message == 0 then
        player:addTreasure(ItemList[math.random(#ItemList)], npc)
        npc:setLocalVar("Message", 1)
    end
    npc:entityAnimationPacket("open")
    npc:setLocalVar("open", 1)
    npc:timer(15000, function(npc)
        npc:entityAnimationPacket("kesu")
    end)
    npc:timer(16000, function(npc)
        npc:setStatus(tpz.status.DISAPPEAR)
        npc:timer(500, function(mob)
            npc:setLocalVar("open", 0)
        end)
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end