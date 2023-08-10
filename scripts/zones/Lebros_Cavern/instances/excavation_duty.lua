-----------------------------------
--
-- Assault: Excavation Duty
--
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
require("scripts/globals/instance")
require("scripts/globals/missions")
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------

function onInstanceCreated(instance)
    --for i, v in pairs(ID.mob[21]) do
    for v = 17035562,17035612,1 do
        SpawnMob(v, instance)
    end
    instance:getEntity(bit.band(ID.npc.RUNE_OF_RELEASE, 0xFFF), tpz.objType.NPC):setPos(160.1609,-40.0341,325.9784,0)
    instance:getEntity(bit.band(ID.npc.ANCIENT_LOCKBOX, 0xFFF), tpz.objType.NPC):setPos(160.1609,-40.0341,328.9784,0)

    instance:getEntity(bit.band(ID.npc._1rx, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Brittle Rocks
    instance:getEntity(bit.band(ID.npc._1ry, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Brittle Rocks
    instance:getEntity(bit.band(ID.npc._1rz, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Brittle Rocks
    instance:getEntity(bit.band(ID.npc._jr0, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Brittle Rocks
    instance:getEntity(bit.band(ID.npc._jr1, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Brittle Rocks
end

function afterInstanceRegister(player)
    player:addKeyItem(1868)     -- MAP_OF_LEBROS_CAVERN
    player:addTempItem(5436)    -- Dusty reraise
    player:addTempItem(5431)    -- Dusty Potion
    player:addTempItem(5824)    -- Lucid Potion
    player:addTempItem(5825)    -- Lucid Potion II
    player:addTempItem(5826)    -- Lucid Potion III
    player:addTempItem(5437)    -- Flask of Strange Milk
    player:addTempItem(5835)    -- Healing Salve
    player:addTempItem(5836)    -- Healing Salve II
    player:addTempItem(5837)    -- Clear Salve
    player:addTempItem(5838)    -- Clear Salve II
    afterAssaultRegister(player, 5345, ID.text, ID.mob)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1868) -- MAP_OF_LEBROS_CAVERN
    end
    onAssaultFailure(instance, 102, ID.text)
end

function onInstanceProgressUpdate(instance, progress)
    if progress == 1 then    
        instance:complete()
    end
end

function onInstanceComplete(instance)
    onAssaultComplete(instance, 5, 10, ID.text, ID.npc)
end

function onEventUpdate(player, csid, option)
end
