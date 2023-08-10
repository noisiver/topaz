-----------------------------------
-- Area: Golden Salvage(Ilrusi Atoll)
-- NPC:  Cursed Chest
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
-----------------------------------
function onTrade(player,npc,trade)
    --if npc:getID() == 17002776 then
        --npc:setPos(341.5745,-15.7312,-194.2174, 160)
    --end
end

function onTrigger(player, npc)
    local instance = npc:getInstance()
    local LamiaNo13 = GetMobByID(17002763,instance)
    if npc:getID() == 17002776 then -- G-10
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
    elseif npc:getID() == 17002777 then -- I-7 Boat
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
    elseif npc:getID() == 17002778 then -- J-5
    	LamiaNo13:setLocalVar("Haste", 1)
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:PrintToPlayer("The beast grows slower...",0,"Cursed Chest")
            end
        end
    elseif npc:getID() == 17002779 then -- J-7
    	LamiaNo13:setLocalVar("DT", 1)
        for _, member in pairs(player:getAlliance()) do
            if member:getZoneID() == player:getZoneID() then
                member:PrintToPlayer("The beast becomes more vulnerable...",0,"Cursed Chest")
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
