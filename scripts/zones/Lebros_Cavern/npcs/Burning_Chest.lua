-----------------------------------
-- Area: Golden Salvage(Ilrusi Atoll)
-- NPC:  Cursed Chest
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
local ID = require("scripts/zones/Lebros_Cavern/IDs")
-----------------------------------
function onTrade(player,npc,trade)
    --if npc:getID() == 17035620 then
        --npc:setPos(100.5402,-39.9323,301.0125,0)
    --end
end

function onTrigger(player, npc)
    local instance = npc:getInstance()
    if npc:getID() == 17035615 then -- G-10
        player:addTempItem(5389) -- spy's drink
        player:addTempItem(5440) -- dusty wing
        player:addTempItem(5390) -- braver's drink
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5389, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5440, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5390, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17035616 then -- F-8
        player:addTempItem(5851) -- berserkers tonic
        player:addTempItem(5839) -- stalwarts tonic
        player:addTempItem(5393) -- monarchs drink
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5851, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5839, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5393, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17035617 then -- J-7
        player:addTempItem(5437)    -- Flask of Strange Milk
        player:addTempItem(5431)    -- Dusty Potion
        player:addTempItem(5824)    -- Lucid Potion
        player:addTempItem(5835)    -- Healing Salve
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5437, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5431, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5824, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5835, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17035618 then -- I-8
        player:addTempItem(5431)    -- dusty potion
        player:addTempItem(5824)    -- Lucid Potion
        player:addTempItem(5825)    -- Lucid Potion II
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5431, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5824, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5825, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17035619 then -- G-6
        player:addTempItem(5832)    --  healing mist
        player:addTempItem(5322)    -- healing powder
        player:addTempItem(5826)    -- Lucid Potion III
        player:addTempItem(5836)    -- Healing Salve II
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5832, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5322, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5826, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5836, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17035620 then -- F-7
        player:addTempItem(5395) -- clerics drink
        player:addTempItem(5393) -- monarchs drink
        player:addTempItem(5394) -- Gnostics drink
        player:addTempItem(5837) -- Clear Salve
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5395, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5393, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5394, param2, param3, param4, nil)
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5837, param2, param3, param4, nil)
            end
        end
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
