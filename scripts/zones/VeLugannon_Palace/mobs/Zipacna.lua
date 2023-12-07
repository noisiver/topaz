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
        { x = -171, y = 0, z = 360   },
        { x = -83,  y = 0, z = 459   },
    }

    local blueDoorPathingOpened =
    {
        { x = -171, y = 0, z = 360   },
        { x = -83,  y = 0, z = 459   },
        { x = -108, y = 0, z = 458   },
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
    }

    local yellowDoorPathing =
    {
        { x = -108, y = 0, z = 458   },
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
    }

    local yellowDoorPathingOpened =
    {
        { x = -171, y = 0, z = 360   },
        { x = -83,  y = 0, z = 459   },
        { x = -108, y = 0, z = 458   },
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
        { x = -108, y = 0, z = 458   },
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
    }

    local blueGate = GetNPCByID(ID.npc.H3_BLUE_GATE)
    local yellowGate = GetNPCByID(ID.npc.H3_YELLOW_GATE)
    local pathingTable = yellowDoorPathing

    local spawnPos = mob:getSpawnPos()
    -- Spawned inside the Blue Gate
    if (spawnPos.x == -173 and spawnPos.y == 0 and spawnPos.z == 360) then
        pathingTable = blueDoorPathing
        if blueGate:getAnimation() == tpz.anim.OPEN_DOOR then
            pathingTable = blueDoorPathingOpened
        end
    else -- Spawned inside the Yellow Gate
        pathingTable = yellowDoorPathing
        if yellowGate:getAnimation() == tpz.anim.OPEN_DOOR then
            pathingTable = yellowDoorPathingOpened
        end
    end

    tpz.path.loop(mob, pathingTable, tpz.path.flag.RUN)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200) -- 2 hours
end
