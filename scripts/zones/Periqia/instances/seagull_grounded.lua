-----------------------------------
-- Assault: Seagull Grounded
-- The Immortals have captured a member of the Seagull Phratrie, a rebel organization.
-- You are to escort the prisoner safely to a holding area.
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
require("scripts/globals/instance")
require("scripts/globals/missions")
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------

function onInstanceCreated(instance)
    for i, v in pairs(ID.mob[31]) do
        SpawnMob(v, instance)
    end
    instance:getEntity(bit.band(ID.npc.RUNE_OF_RELEASE, 0xFFF), tpz.objType.NPC):setPos(-495.000,-9.695,-72.000,0)
    instance:getEntity(bit.band(ID.npc.ANCIENT_LOCKBOX, 0xFFF), tpz.objType.NPC):setPos(-490.000,-9.900,-72.000,0)

    instance:getEntity(bit.band(ID.npc._1K6, 0xFFF), tpz.objType.NPC):setAnimation(9) -- Rock H-8
    --instance:getEntity(bit.band(ID.npc._1KX, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Door H-9
    --instance:getEntity(bit.band(ID.npc._1KZ, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Door I-9
    --instance:getEntity(bit.band(ID.npc._JK1, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Door I-6 (Entrance)
    --instance:getEntity(bit.band(ID.npc._JK3, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Door G-11 (Before Final Fight)
end

function  afterInstanceRegister(player)
    player:addKeyItem(1870)     -- MAP_OF_PERIQIA
    player:addTempItem(5436)    -- Dusty reraise
    player:addTempItem(5824)    -- Lucid Potion
    player:addTempItem(5825)    -- Lucid Potion II
    player:addTempItem(5826)    -- Lucid Potion III
    player:addTempItem(5827)    -- Lucid ether
    player:addTempItem(5432)    -- Dusty ether
    player:addTempItem(5390)    -- Braver's Drink
    player:addTempItem(5385)    -- Barbarian's Drink
    player:addTempItem(5393)    -- Monarch's Drink
    player:addTempItem(5387)    -- Oracle's Drink
    player:addTempItem(5835)    -- Healing Salve
    player:addTempItem(5836)    -- Healing Salve II
    player:addTempItem(5837)    -- Clear Salve
    player:addTempItem(5838)    -- Clear Salve II
    afterAssaultRegister(player, 5346, ID.text, ID.mob)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1870) -- MAP_OF_PERIQIA
    end
    onAssaultFailure(instance, 102, ID.text)
end

function onInstanceProgressUpdate(instance, progress)
    if (instance:getProgress() > 0) then
        instance:complete()
    end
end

function onInstanceComplete(instance)
    onAssaultComplete(instance, 5, 11, ID.text, ID.npc)
end

function onEventUpdate(player, csid, option)
end
