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

    local greenDoorPathing =
    {
        { x = -108, y = 0, z = 458   },
        { x = -62,  y = 0, z = 457   },
        { x = -59,  y = 0, z = 422   },
        { x =  58,  y = 0, z = 420   },
        { x =  61,  y = 0, z = 457   },
        { x =  110, y = 0, z = 456   },
    }

    local blueGate = GetNPCByID(ID.npc.H3_BLUE_GATE)
    local pathingTable = greenDoorPathing

    if blueGate:getAnimation() == tpz.anim.CLOSE_DOOR then
        --pathingTable = blueDoorPathing
    end

    tpz.path.loop(mob, pathingTable, tpz.path.flag.RUN)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
