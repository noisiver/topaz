-----------------------------------
-- Area: VeLugannon Palace
--  Mob: Zipacna
-----------------------------------
local ID = require("scripts/zones/VeLugannon_Palace/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------


function onMobInitialize(mob)
	mob:setMod(tpz.mod.MOVE, 45)
end


function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
    mob:setLocalVar("path", 0)
    mob:setLocalVar("pathstep", 0)
end


function onMobRoam(mob)
    local blueDoorPathing =
    {
        { x = -163, y = 0, z = 380   },
        { x = -133, y = 0, z = 381   },
        { x = -108, y = 0, z = 458   },
    }

    local greenDoorPathing =
    {
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
    }

    local blueGate = GetNPCByID(ID.npc.H3_BLUE_GATE)
    local pathingTable = greenDoorPathing

    if blueGate:getAnimation() == tpz.anim.OPEN_DOOR then
        pathingTable = blueDoorPathing
    end

    if not mob:isFollowingPath() then
        local path = mob:getLocalVar("path")
        local step = mob:getLocalVar("pathstep");
        path = path + step;
        if (path > #pathingTable) then
            path = #pathingTable - 1;
            mob:setLocalVar("pathstep", -1);
        elseif (path < 1) then
            path = 2;
            mob:setLocalVar("pathstep", 1);
        end
        
        mob:setLocalVar("path", path);
        local currentPath = pathingTable[path];
        mob:pathTo(currentPath.X, currentPath.Y, currentPath.Z, tpz.path.flag.RUN);
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
