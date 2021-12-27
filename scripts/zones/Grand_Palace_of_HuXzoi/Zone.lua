-----------------------------------
--
-- Zone: Grand_Palace_of_HuXzoi (34)
--
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/globals")
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
require("scripts/globals/conquest")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion( 1, -507, -4, 697, -501, 4, 702);
    zone:registerRegion( 2, -102, -4, 541,  -97, 4, 546);
    zone:registerRegion( 3, -178, -4,  97, -173, 4, 103);
    zone:registerRegion( 4, -497, -4,  97, -492, 4, 102);
    zone:registerRegion( 5, -742, -4, 372, -736, 4, 379);
    zone:registerRegion( 6,  332, -4, 696,  338, 4, 702);
    zone:registerRegion( 7,  737, -4, 541,  742, 4, 546);
    zone:registerRegion( 8,  661, -4,  87,  667, 4, 103);
    zone:registerRegion( 9,  340, -4,  97,  347, 4, 102);
    zone:registerRegion(10,   97, -4, 372,  103, 4, 378);

    -- Escort Quasilumin Door Regions
    zone:registerRegion(11,  695, -4, 432,  704, 4, 450) -- Escort 2 Security Door 1
    zone:registerRegion(12,  609, -4, 455,  565, 4, 465) -- Escort 2 Security Door 2
    zone:registerRegion(13,  494, -4, 263,  456, 4, 248) -- Escort 3 Security Door 1
    zone:registerRegion(14,  372, -4, 256,  324, 4, 266) -- Escort 3 Security Door 2
    zone:registerRegion(15, -504, -4, 265, -496, 4, 308) -- Escort 4 Security Door 1
    zone:registerRegion(16, -537, -4, 428, -545, 4, 463) -- Escort 4 Security Door 2
    zone:registerRegion(17, -544, -4, 464, -531, 4, 498) -- Escort 4 Security Door 3
    zone:registerRegion(18, -502, -4, 508, -492, 4, 544) -- Escort 4 Security Door 4
    zone:registerRegion(19, -453, -4, 546, -416, 4, 525) -- Escort 4 Security Door 5

    GRAND_PALACE_OF_HUXZOI.pickTemperancePH();
    GetMobByID(ID.mob.JAILER_OF_TEMPERANCE):setLocalVar("pop", os.time())
end;

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-20, -1.5, -355.482, 192)
    end

    player:setCharVar("Hu-Xzoi-TP", 0)

    return cs
end

function afterZoneIn(player)
    player:entityVisualPacket("door")
    player:entityVisualPacket("dtuk")
    player:entityVisualPacket("2dor")
    player:entityVisualPacket("cryq")
end

local doors =
{
    [11] = 16916872, -- Escort 2 Security Door 1
    [12] = 16916873, -- Escort 2 Security Door 2
    [13] = 16916877, -- Escort 3 Security Door 1
    [14] = 16916878, -- Escort 3 Security Door 2
    [15] = 16916882, -- Escort 4 Security Door 1
    [16] = 16916883, -- Escort 4 Security Door 2
    [17] = 16916884, -- Escort 4 Security Door 3
    [18] = 16916885, -- Escort 4 Security Door 4
    [19] = 16916886, -- Escort 4 Security Door 5
}

function onRegionEnter(player, region)
    local regionId = region:GetRegionID()
    if (player:getCharVar("Hu-Xzoi-TP") == 0 and player:getAnimation() == tpz.anim.NONE) and regionId < 11 then -- prevent 2cs at same time
        player:startEvent(149 + region:GetRegionID())
    end
end

function onRegionLeave(player, region)
end

function onEventUpdate(player, csid, option)
    if (csid >= 150 and csid <= 159) then
        player:setCharVar("Hu-Xzoi-TP", 1)
    end
end

function onEventFinish(player, csid, option)
    if (csid >= 150 and csid <= 159) then
        player:setCharVar("Hu-Xzoi-TP", 0)
    end
end

function onGameHour(zone)
end
