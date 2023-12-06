-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Guivre
-----------------------------------
require("scripts/globals/pathfind")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------


function onMobSpawn(mob)
    mob:setDamage(125)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 18000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:pathTo(101, 0, -4, tpz.path.flag.NONE)
    mob:setLocalVar("path", 1)
end

function onMobRoam(mob)
    local Pos = mob:getPos()
    local path = mob:getLocalVar("path")

    if not mob:isFollowingPath() then
        if (path == 1) then
            mob:setLocalVar("path", 2)
            mob:pathTo(71, -8, -56, tpz.path.flag.NONE)
        end

        if (path == 2) then
            mob:setLocalVar("path", 3)
            mob:pathTo(40, -8, -98, tpz.path.flag.NONE)
        end

        if (path == 3) then
            mob:setLocalVar("path", 4)
            mob:pathTo(-45, 0, 11, tpz.path.flag.NONE)
        end

        if (path == 4) then
            mob:setLocalVar("path", 5)
            mob:pathTo(6, 0, 72, tpz.path.flag.NONE)
        end

        if (path == 5) then
            mob:setLocalVar("path", 1)  
            mob:pathTo(101, 0, -4, tpz.path.flag.NONE)
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(64800, 43200)) -- 18 to 24 hours
end
