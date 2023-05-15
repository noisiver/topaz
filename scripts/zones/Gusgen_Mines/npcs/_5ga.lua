-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5ga (Lever C)
-- !pos 44 -40.561 -54.199 196
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    --local nID = npc:getID()
    -- printf("id: %u", nID)

    npc:openDoor(2) -- Lever animation
    npc:timer(750, function(npc)
        local lever = npc:getID()

        if GetNPCByID(lever - 6):getAnimation() == 9 then
            -- send dustcloud animation
            SendEntityVisualPacket(GetNPCByID(lever - 6):getID(), "kem1")

            GetNPCByID(lever - 6):setAnimation(8) --open door C (_5g0)
            GetNPCByID(lever - 5):setAnimation(9) --close door B (_5g1)
            GetNPCByID(lever - 4):setAnimation(9) --close door A (_5g2)
        end
    end)

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
