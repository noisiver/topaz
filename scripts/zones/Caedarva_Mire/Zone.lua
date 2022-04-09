-----------------------------------
--
-- Zone: Caedarva_Mire (79)
--
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/missions")
require("scripts/globals/titles")
require("scripts/globals/helm")
require("scripts/globals/zone")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    -- Gravity / Zikko  Marsh
    zone:registerRegion(1, 134, -6, -184, 149, -6, 178) -- Lamian Fang Key Marsh
    -- Karakul Marsh 
    zone:registerRegion(2, 307, -14, -333, 297, -14, -347)
    zone:registerRegion(3, 301, -14, -365, 310, -14, -387)
    zone:registerRegion(4, 290, -14, -379, 0, 0, 0)
    --Jnun/Imp/Fly Marsh 
    zone:registerRegion(5, 447, -6, -288, 0, 0, 0)
    zone:registerRegion(6, 451, -6, -298, 0, 0, 0)
    zone:registerRegion(7, 458, -6, -310, 0, 0, 0)
    zone:registerRegion(8, 469, -6, -301, 0, 0, 0)
    zone:registerRegion(9, 457, -6, -328, 0, 0, 0)
    zone:registerRegion(10, 458, -6, -341, 0, 0, 0)

    UpdateNMSpawnPoint(ID.mob.AYNU_KAYSEY)

    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(339.996, 2.5, -721.286, 200)
    end
    if prevZone == tpz.zone.LEUJAOAM_SANCTUM then
        player:setPos(495.450, -28.25, -478.43, 32)
    end
    if prevZone == tpz.zone.PERIQIA then
        player:setPos(-252.715, -7.666, -30.64, 128)
    end

    if (player:getCurrentMission(TOAU) == tpz.mission.id.toau.SHADES_OF_VENGEANCE and player:getCharVar("AhtUrganStatus") == 1) then
        cs = 21
    end

    return cs
end

function afterZoneIn(player)
    player:entityVisualPacket("1pb1")
    player:entityVisualPacket("2pb1")
    player:entityVisualPacket("1pd1")
    player:entityVisualPacket("2pc1")
end

function onRegionEnter(player, region)
    local stauseffects =
    {
        [1] = tpz.effect.QUICKENING, 25, 0, 180,
        [2] = tpz.effect.FLEE, 100, 0, 180,
        [3] = tpz.effect.STONESKIN, 350, 0, 180,
        [4] = tpz.effect.HASTE, 1465, 0, 180,
        [5] = tpz.effect.SLOW, 2550, 0, 180,
    }
    local Zikko = GetMobByID(17101144)
    local Respawn = GetServerVariable("Zikko_Respawn")
    local RNG = math.random(100)
    local RegionID = region:GetRegionID()
    
    if (RegionID <= 10) then
        printf("Entered Region")
        if RNG <= 50 then
            printf("Apply Weight")
            player:addStatusEffect(tpz.effect.WEIGHT, 50, 0, 180)
        elseif RNG <= 25 then
            printf("Apply Random Status from Table")
            player:addStatusEffect(stauseffects[math.random(#stauseffects)])
        elseif RNG <= 5 and Respawn <= os.time() then
            printf("Spawn Zikko")
            player:addStatusEffect(tpz.effect.WEIGHT, 50, 0, 180)
            Zikko:setPos(player:getPos())
            SpawnMob(ID.mob.ZIKKO):updateClaim(player)
            SetServerVariable("Zikko_Respawn", os.time() + 120)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 21 then
        player:completeMission(TOAU, tpz.mission.id.toau.SHADES_OF_VENGEANCE)
        player:setCharVar("AhtUrganStatus", 0)
        player:setCharVar("TOAUM31_PERMITDAY", 0)
        player:setTitle(tpz.title.NASHMEIRAS_MERCENARY)
        player:addMission(TOAU, tpz.mission.id.toau.IN_THE_BLOOD)
    elseif csid == 133 then -- enter instance, warp to periqia
        player:setPos(0, 0, 0, 0, 56)
    elseif csid == 130 then
        player:setPos(0, 0, 0, 0, 69)
    end
end
