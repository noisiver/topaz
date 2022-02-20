-----------------------------------
--
-- Assault: Leujaoam Cleansing
--
-----------------------------------
local ID = require("scripts/zones/Leujaoam_Sanctum/IDs")
require("scripts/globals/instance")
require("scripts/globals/missions")
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------

function onInstanceCreated(instance)
    for i, v in pairs(ID.mob[1]) do
        SpawnMob(v, instance)
    end
    instance:getEntity(bit.band(ID.npc.RUNE_OF_RELEASE, 0xFFF), tpz.objType.NPC):setPos(511.3300,8.5709,-81.2756,239)
    instance:getEntity(bit.band(ID.npc.ANCIENT_LOCKBOX, 0xFFF), tpz.objType.NPC):setPos(511.3300,8.5709,-82.2756,239)

    instance:getEntity(bit.band(ID.npc._1xn, 0xFFF), tpz.objType.NPC):setAnimation(8) -- Ice Wall G-8
end

function afterInstanceRegister(player)
    player:addKeyItem(1866) -- MAP_OF_LEUJAOAM_SANCTUM
    player:addTempItem(5436)    -- Dusty reraise
    afterAssaultRegister(player, 5343, ID.text, ID.mob)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1866) -- MAP_OF_LEUJAOAM_SANCTUM
    end
    onAssaultFailure(instance, 102, ID.text)
end

function onInstanceProgressUpdate(instance, progress)
    if progress == 1 then
        instance:complete()
    end
end

function onInstanceComplete(instance)
    onAssaultComplete(instance, 8, 8, ID.text, ID.npc)
end

function onEventUpdate(player, csid, option)
end
