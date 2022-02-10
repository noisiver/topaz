-----------------------------------
-- Area: Seagull Grounded
-- NPC:  Cursed Chest
-----------------------------------
function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
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
    player:addTreasure(2488, npc) -- 
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
