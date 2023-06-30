-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5ge (Lever E)
-- !pos 20 -20.561 143.801 196
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

            GetNPCByID(lever - 7):setAnimation(9) -- close door F
            GetNPCByID(lever - 6):setAnimation(8) -- open door E
            GetNPCByID(lever - 5):setAnimation(9) -- close door D
        end
    end)

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
