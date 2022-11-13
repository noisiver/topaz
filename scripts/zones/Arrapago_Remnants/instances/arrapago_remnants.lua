-----------------------------------
--
-- Salvage: Arrapago Remnants
--
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/salvage")
-----------------------------------
respawnPoints =
{

}

function afterInstanceRegister(player)
    salvageUtil.afterInstanceRegister(player, tpz.items.CAGE_OF_A_REMNANTS_FIREFLIES)
end

function onInstanceCreated(instance)
    -- Mob / Other NPC spawns(chests etc) handled in door lua files such as _220
    for i, v in pairs(ID.npc[1][1]) do
        local npc = GetNPCByID(v, instance)
        npc:setStatus(tpz.status.NORMAL)
    end
    instance:setStage(1)
    instance:setProgress(0)
end

function onInstanceTimeUpdate(instance, elapsed)
    local stage = instance:getStage()
    local progress = instance:getProgress()

    if (progress == 100) then return end -- Used for Sahtra Lihtenem boss fight
        -- Check for wipe
    if (stage == 1 and progress == 1) then -- Floor 1
        salvageUtil.raiseGroup(instance, 247, -20, -327, 0, 3)
    elseif (stage == 1 and progress == 2) then
        salvageUtil.raiseGroup(instance, 259, -20, -512, 193, 3)
    elseif (stage == 1 and progress == 3) then
        salvageUtil.raiseGroup(instance, 429, -20, -499, 127, 3)
    elseif (stage == 1 and progress == 4) then
        salvageUtil.raiseGroup(instance, 451, -20, -379, 127, 3)
    elseif (stage == 2) then -- Floor 2
        if salvageUtil.raiseGroup(instance, 340, -4, 86, 193, 3) then
            -- Respawn ramparts
            salvageUtil.spawnMob(instance, 17080489)
            salvageUtil.spawnMob(instance, 17080492)
            salvageUtil.spawnMob(instance, 17080509)
            salvageUtil.spawnMob(instance, 17080512)
        end
    elseif (stage == 3) then -- Floor 3
        salvageUtil.raiseGroup(instance, 339, -0, math.random(456, 464), 129, 3) 
    elseif (stage == 4 and progress == 0) then -- Floor 4
        salvageUtil.raiseGroup(instance, math.random(-342, -335), -0, -580, 0, 3) 
    elseif (stage == 4 and progress == 1) then -- Floor 4
        salvageUtil.raiseGroup(instance, -339, -0, math.random(-503, -496), 0, 3)
    elseif (stage == 5) then -- Floor 5
        salvageUtil.raiseGroup(instance, math.random(-303, -298), -0, -19, 0, 3) 
    end
    updateInstanceTime(instance, elapsed, ID.text)
end

function onInstanceFailure(instance)

    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(1)
    end
end

function onInstanceComplete(instance)
end

function onRegionEnter(player, region, instance)
    local instance = player:getInstance()
    local RegionID = region:GetRegionID()
    local progress = instance:getProgress()
    local stage = instance:getStage()

    -- Teleporters
    if (RegionID <= 4 and stage == 1 and progress == 5) then -- F1
        player:startEvent(199 + RegionID)
    elseif (RegionID == 5 and stage == 2 and progress == 4) then -- F2
        player:startEvent(199 + RegionID)
    elseif (RegionID >= 6 and RegionID <= 7 and stage == 3 and progress == 2) then -- F3
        player:startEvent(199 + RegionID)
    elseif (RegionID == 8 and stage == 4 and progress == 1) then -- F4 1st
        salvageUtil.teleportGroup(player, -339, -0, math.random(-503, -496), 0, true, false, false)
        -- player:startEvent(199 + RegionID) Ports to H-9
    elseif (RegionID == 9 and stage == 4 and progress == 2) then -- F4 2nd 
        player:startEvent(199 + RegionID)
    elseif (RegionID == 10 and stage == 5 and progress == 2) then -- F5 
        player:startEvent(199 + RegionID)
    else
        player:PrintToPlayer("Nothing happens...", 0xD, none)
    end

    --if region:GetRegionID() <= 11 and instance:getStage() > 1 then -- Alucard is dead, enble teleporters on Floor 1 
       --player:startEvent(199 + region:GetRegionID())
    --end

    -- First floor forced teleport to bosses
    if (RegionID == 12 and progress == 0) then
        instance:setProgress(1)
        salvageUtil.teleportGroup(player, 247, -20, -327, 0, true, false, false)
        salvageUtil.msgGroup(player, "A mysterious force pulls you towards it...", 0xD, none)
    elseif (RegionID == 13 and progress == 1) then
        instance:setProgress(2)
        salvageUtil.teleportGroup(player, math.random(253, 267), -20, -515, 193, true, false, false)
        salvageUtil.msgGroup(player, "A mysterious force pulls you towards it...", 0xD, none)
    elseif (RegionID == 14 and progress == 2) then
        instance:setProgress(3)
        salvageUtil.teleportGroup(player, 429, -20, -499, 127, true, false, false)
        salvageUtil.msgGroup(player, "A mysterious force pulls you towards it...", 0xD, none)
    end
end

function onInstanceProgressUpdate(instance, progress, elapsed)
    if instance:getStage() == 2 and progress == 4 then -- All bosses on floor 2 are dead, enable teleporter
        --SpawnMob(ID.mob[1][2].rampart, instance)
    elseif instance:getStage() == 2 and progress == 2 then -- attempt to spawn slot
        GetNPCByID(ID.npc[2][2].SLOT, instance):setStatus(tpz.status.NORMAL)
    elseif instance:getStage() == 2 and progress == 3 then -- attempt to spawn socket
        GetNPCByID(ID.npc[2][2].SOCKET, instance):setStatus(tpz.status.NORMAL)
    elseif instance:getStage() == 3 and progress == 1 then
        SpawnMob(ID.mob[2][0].astrologer, instance)
    elseif instance:getStage() == 6 and progress == 1 then
        GetNPCByID(ID.npc[6].DOOR, instance):setLocalVar("start", os.time())
    elseif instance:getStage() == 7 and progress == 0 then
        local door = GetNPCByID(ID.npc[6].DOOR, instance)
        door:setLocalVar("current", os.time())
        if (door:getLocalVar("current") - door:getLocalVar("start") <= 420) then
            SpawnMob(ID.mob[6].treasure_hunter1, instance)
            SpawnMob(ID.mob[6].treasure_hunter2, instance)
            SpawnMob(ID.mob[6].qiqirn_mine_1, instance)
            SpawnMob(ID.mob[6].qiqirn_mine_2, instance)
        end
    end
end

function onEventFinish(player, csid, option)
    local instance = player:getInstance()

    if csid >= 200 and csid <= 203 and option == 1 then -- Port from 1st floor to 2nd floor
        instance:setStage(2)
        instance:setProgress(0)
        -- Spawn Ramparts
        SpawnMob(17080489, instance)
        SpawnMob(17080492, instance)
        SpawnMob(17080509, instance)
        SpawnMob(17080512, instance)
        salvageUtil.spawnMobGroup(instance, ID.mob[2][1].mobs_start, ID.mob[2][1].mobs_end)
        salvageUtil.teleportGroup(player, math.random(332, 348), -4, 86, 193, true, false, true)
        salvageUtil.saveFloorProgress(player)
    elseif csid == 204 and option == 1 then -- Port from 2nd floor to 3rd floor
        instance:setStage(3)
        instance:setProgress(0)
        salvageUtil.spawnMobGroup(instance, ID.mob[3][1].mobs_start, ID.mob[3][1].mobs_end) 
        salvageUtil.saveFloorProgress(player)
    elseif csid == 205 or csid == 206 and option == 1 then -- Port from 3rd floor to 4th floor
        instance:setStage(4)
        instance:setProgress(0)
        salvageUtil.spawnMobGroup(instance, ID.mob[4][1].mobs_start, ID.mob[4][1].mobs_end) 
        salvageUtil.saveFloorProgress(player) 
    elseif csid == 207 or csid == 208 and option == 1 then -- Port from 4th floor to 5th floor
        instance:setStage(5)
        instance:setProgress(0)
        salvageUtil.spawnMobGroup(instance, ID.mob[5][1][1].mobs_start, ID.mob[5][1][1].mobs_end) 
        salvageUtil.saveFloorProgress(player)
    elseif csid == 209 and option == 1 then
        for id = ID.mob[6][1].mobs_start, ID.mob[6][1].mobs_end do
            SpawnMob(id, instance)
        end
        SpawnMob(ID.mob[6].rampart1, instance)
        SpawnMob(ID.mob[6].rampart2, instance)
        instance:setProgress(csid - 208)
        for id = ID.mob[5][1][1].mobs_start, ID.mob[5][2].chariot do
            DespawnMob(id, instance)
        end
    elseif csid == 210 and option == 1 then
        SpawnMob(ID.mob[7][1].chariot, instance)
        instance:setProgress(csid - 209)
        for id = ID.mob[6].rampart1, ID.mob[6].rampart4 do
            DespawnMob(id, instance)
        end
    end
end
