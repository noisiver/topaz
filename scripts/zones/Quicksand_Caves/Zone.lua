-----------------------------------
--
-- Zone: Quicksand_Caves (208)
--
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/treasure")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    -- Weight Door System (RegionID, X, Radius, Z)
    zone:registerRegion(1, -15, 5, -60, 0, 0, 0)
    zone:registerRegion(3, 15, 5, -180, 0, 0, 0)
    zone:registerRegion(5, -580, 5, -420, 0, 0, 0)
    zone:registerRegion(7, -700, 5, -420, 0, 0, 0)
    zone:registerRegion(9, -700, 5, -380, 0, 0, 0)
    zone:registerRegion(11, -780, 5, -460, 0, 0, 0)
    zone:registerRegion(13, -820, 5, -380, 0, 0, 0)
    zone:registerRegion(15, -260, 5, 740, 0, 0, 0)
    zone:registerRegion(17, -340, 5, 660, 0, 0, 0)
    zone:registerRegion(19, -340, 5, 820, 0, 0, 0)
    zone:registerRegion(21, -409, 5, 800, 0, 0, 0)
    zone:registerRegion(23, -420, 5, 740, 0, 0, 0)
    zone:registerRegion(25, -400, 5, 670, 0, 0, 0)

    -- Hole in the Sand
    zone:registerRegion(30, 495, -9, -817, 497, -7, -815) -- E-11 (Map 2)
    zone:registerRegion(31, 815, -9, -744, 817, -7, -742) -- M-9 (Map 2)
    zone:registerRegion(32, 215, 6, -17, 217, 8, -15)     -- K-6 (Map 3)
    zone:registerRegion(33, -297, 6, 415, -295, 8, 417)   -- E-7 (Map 6)
    zone:registerRegion(34, -137, 6, -177, -135, 8, -175) -- G-7 (Map 8)

    tpz.treasure.initZone(zone)

    npcUtil.UpdateNPCSpawnPoint(ID.npc.ANTICAN_TAG_QM, 60, 120, ID.npc.ANTICAN_TAG_POSITIONS, "[POP]Antican_Tag")
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-980.193, 14.913, -282.863, 60)
    end
    return cs
end

function getWeight(player)
    local race = player:getRace()
    if race == tpz.race.GALKA or player:hasKeyItem(tpz.ki.LOADSTONE) then
        return 3
    elseif race == tpz.race.TARU_M or race == tpz.race.TARU_F then
        return 1
    else
        return 2
    end
end

function onRegionEnter(player, region)
    local RegionID = region:GetRegionID()

    -- holes in the sand
    if player and (RegionID >= 30) then
        switch (RegionID): caseof
        {
            [30] = function (x)
                player:setPos(496, -6, -816)
            end,
            [31] = function (x)
                player:setPos(816, -6, -743)
            end,
            [32] = function (x)
                player:setPos(216, 9, -16)
            end,
            [33] = function (x)
                player:setPos(-296, 9, 416)
            end,
            [34] = function (x)
                player:setPos(-136, 9, -176)
            end,
        }

    -- ornate door pressure plates
    else
        local door = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + RegionID - 1)
        local plate = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + RegionID)

        local totalWeight = plate:getLocalVar("weight")
        if player then
            totalWeight = totalWeight + getWeight(player)
            plate:setLocalVar("weight", totalWeight)
        end

        if
            totalWeight >= 3 and
            plate:getLocalVar("opening") == 0 and
            door:getAnimation() == tpz.animation.CLOSE_DOOR
        then
            SendEntityVisualPacket(plate:getID(), "unlc") -- Play the light animation
            plate:setLocalVar("opening", 1)

            -- wait 5 seconds to open the door
            door:timer(5000, function(doorArg)
                doorArg:openDoor(10) -- open door with a 10 second time delay.
            end)

            -- allow door to retrigger 17 seconds from now
            plate:timer(17000, function(plateArg)
                plateArg:setLocalVar("opening", 0)

                -- retrigger if weight is still enough to do so
                if plateArg:getLocalVar("weight") >= 3 then
                    -- retrigger, with nil as player arg, player is not necessary to re-open the door if weight is >= 3.
                    zoneObject.onTriggerAreaEnter(nil, triggerArea)
                end
            end)
        end
    end
end

function onRegionLeave(player, region)
    local RegionID = region:GetRegionID()

    if (RegionID < 30) then
        local plate = GetNPCByID(ID.npc.ORNATE_DOOR_OFFSET + triggerAreaID)

        local totalWeight = plate:getLocalVar("weight")
        totalWeight = totalWeight - getWeight(player)
        plate:setLocalVar("weight", totalWeight)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
