-----------------------------------
-- Assault: Imperial Agent Rescue
-- An agent sent to spy on the secret training grounds of the Mamool Ja has been captured.
-- Rescue him before he is interrogated for Imperial secrets.
-----------------------------------
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
require("scripts/globals/instance")
require("scripts/globals/missions")
require("scripts/globals/assault")
require("scripts/globals/zone")
-----------------------------------
local instance_object = {}
local ItemList =
{
    [1] = 5431,
    [2] = 5432,
    [3] = 5433,
    [4] = 5824,
    [5] = 5825,
    [6] = 5827,
    [7] = 5828,
    [8] = 5830,
    [9] = 5832,
    [10] = 5839,
    [11] = 5841,
    [12] = 5392,
    [13] = 5393,
    [14] = 5395,
    [15] = 5390,
    [16] = 5394,
    [17] = 5851,
    [18] = 5440,
}

function onInstanceCreated(instance)
    for v = 17047923,17047943,1 do
        SpawnMob(v, instance)
    end
    instance:getEntity(bit.band(ID.npc.RUNE_OF_RELEASE, 0xFFF), tpz.objType.NPC):setPos(-48.5366,11.9258,-480.2752,173, 0)
    instance:getEntity(bit.band(ID.npc.ANCIENT_LOCKBOX, 0xFFF), tpz.objType.NPC):setPos(-48.5366,11.9258,-482.2752,173, 0)

    instance:getEntity(bit.band(ID.npc.DOOR_1, 0xFFF), tpz.objType.NPC):setAnimation(9) -- North
    instance:getEntity(bit.band(ID.npc.DOOR_2, 0xFFF), tpz.objType.NPC):setAnimation(9) -- SouthWest
    instance:getEntity(bit.band(ID.npc.DOOR_3, 0xFFF), tpz.objType.NPC):setAnimation(9) -- SouthEast
    instance:getEntity(bit.band(ID.npc.DOOR_4, 0xFFF), tpz.objType.NPC):setAnimation(9) -- G-8 after Poroggo Boss
    instance:getEntity(bit.band(ID.npc.POT_HATCH, 0xFFF), tpz.objType.NPC):setAnimation(9) -- Pot Hatch
end

function afterInstanceRegister(player)
    player:addKeyItem(1867)     -- MAP_OF_THE_TRAINING_GROUNDS
    player:addTempItem(5436)    -- Dusty reraise
    afterAssaultRegister(player, 5344, ID.text, ID.mob)
end

function onInstanceTimeUpdate(instance, elapsed)
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1867) -- MAP_OF_THE_TRAINING_GROUNDS
        for _,item in pairs(ItemList) do
            v:delItem(item, 1)
        end
    end
    onAssaultFailure(instance, 102, ID.text)
end

function onInstanceProgressUpdate(instance, progress)
    if progress == 1 then    
        instance:complete()
    end
end

function onInstanceComplete(instance)
    local chars = instance:getChars()
    for _,v in pairs(chars) do
        v:delKeyItem(1867) -- MAP_OF_THE_TRAINING_GROUNDS
        for _,item in pairs(ItemList) do
            v:delItem(item, 1)
        end
    end
    onAssaultComplete(instance, 9, 8, ID.text, ID.npc)
end

function onEventUpdate(player, csid, option)
end

return instance_object
