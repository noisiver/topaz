-----------------------------------
-- Area: Seagull Grounded(Periqia)
-- NPC:  Cursed Chest
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onTrade(player,npc,trade)
    --if npc:getID() == 17006923 then
        --npc:setPos(-292.5529,-15.3060,260.6910, 126)
    --end
end

function onTrigger(player, npc)
    if npc:getID() == 17006922 then -- North
        player:addTempItem(5851) -- berserkers tonic
        player:addTempItem(5839) -- stalwarts tonic
        player:addTempItem(5393) -- monarchs drink
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5851, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5839, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5393, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17006923 then -- MiddleEast Door
        player:addTempItem(5431) -- dusty potion
        player:addTempItem(5825)    -- Lucid Potion II
        player:addTempItem(5826)    -- Lucid Potion III
        player:addTempItem(5835)    -- Healing Salve
        player:addTempItem(5836)    -- Healing Salve II
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5431, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5825, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5826, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5835, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5836, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17006924 then -- BottomWest Door
        player:addTempItem(5432)    -- Dusty ether
        player:addTempItem(5827)    -- Lucid ether
        player:addTempItem(5828)    -- Lucid ether II
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5432, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5827, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5828, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17006925 then -- G-8
        player:addTempItem(5841) -- ascetics tonic
        player:addTempItem(5394) -- gnostics's drink
        player:addTempItem(5390) -- braver's drink
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5841, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5394, param2, param3, param4, nil)
            end
        end
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:messageName(ID.text.PLAYER_OBTAINS_ITEM, player, 5390, param2, param3, param4, nil)
            end
        end
    elseif npc:getID() == 17006926 then -- I-9
        player:addStatusEffect(tpz.effect.MUTE, 1, 0, 900)
        local zonePlayers = npc:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:messageSpecial(ID.text.EXCALIACE_NOT_USE)
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
