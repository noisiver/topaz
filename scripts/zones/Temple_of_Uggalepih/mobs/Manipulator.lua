-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Manipulator
-- Note: Paths around the 2 staircases
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/pathfind")

local path =
{
	-16.90136, -8,500, -95.6560,
	-30.3574, 0.5000, -81.2659, 
	-47.20266, -3.3550, -85.3781, 
	-53.0145, -8.5000, -95.7291,
	}

function onPath(mob)
    tpz.path.patrol(mob, path)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 50)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 5)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
    onPath(mob)
end

function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(path))
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 383)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
