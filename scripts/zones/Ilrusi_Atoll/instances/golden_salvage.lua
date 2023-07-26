-----------------------------------
--
-- Assault: Golden Salvage
--
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
require("scripts/globals/instance")
require("scripts/globals/missions")
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------

function onInstanceCreated(instance)
    for i, v in pairs(ID.mob[41]) do
        SpawnMob(v, instance)
    end
    
   --[[ for i = ID.mob[GOLDEN_SALVAGE].ILRUSI_CURSED_CHEST_OFFSET, ID.mob[GOLDEN_SALVAGE].ILRUSI_CURSED_CHEST_OFFSET + 7 do
        local sPoint = math.random(1,#spawnPoints) -- Randoms the 1st 8 points for chests, last 4 are static on boats
        instance:getEntity(bit.band(i, 0xFFF), tpz.objType.NPC):setPos(spawnPoints[sPoint])
        instance:getEntity(bit.band(i, 0xFFF), tpz.objType.NPC):setStatus(tpz.status.NORMAL)
        table.remove(spawnPoints,sPoint)
    end ]]

    instance:getEntity(bit.band(ID.npc.RUNE_OF_RELEASE, 0xFFF), tpz.objType.NPC):setPos(435.7197,-7.0001,-123.3230,95)
    instance:getEntity(bit.band(ID.npc.ANCIENT_LOCKBOX, 0xFFF), tpz.objType.NPC):setPos(435.7197,-7.0001,-125.3230,95)
end

function afterInstanceRegister(player)
    player:addKeyItem(1869) -- MAP_OF_ILRUSI_ATOLL
    player:addTempItem(5436)    -- Dusty reraise
    player:addTempItem(5824)    -- Lucid Potion
    player:addTempItem(5825)    -- Lucid Potion II
    player:addTempItem(5826)    -- Lucid Potion III
    player:addTempItem(5827)    -- Lucid ether
    player:addTempItem(5432)    -- Dusty ether
    player:addTempItem(5835)    -- Healing Salve
    player:addTempItem(5836)    -- Healing Salve II
    player:addTempItem(5837)    -- Clear Salve
    player:addTempItem(5838)    -- Clear Salve II
    afterAssaultRegister(player, 5347, ID.text, ID.mob)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1869) -- MAP_OF_ILRUSI_ATOLL
    end
    onAssaultFailure(instance, 102, ID.text)
end

function onInstanceProgressUpdate(instance, progress)
    if progress == 1 then
        instance:complete()
    end
end

function onInstanceComplete(instance)
    onAssaultComplete(instance, 7, 7, ID.text, ID.npc)
end

function onEventUpdate(player, csid, option)
end
