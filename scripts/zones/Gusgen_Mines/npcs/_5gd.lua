-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5gd (Lever F)
-- !pos 44 -20.56 143.802 196
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

            GetNPCByID(lever - 6):setAnimation(8) -- open door F
            GetNPCByID(lever - 5):setAnimation(9) -- close door E
            GetNPCByID(lever - 4):setAnimation(9) -- close door D
        end
    end)

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
