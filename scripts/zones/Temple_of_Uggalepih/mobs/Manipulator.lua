-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Manipulator
-- Note: Paths around the 2 staircases
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/pathfind")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 50)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 5)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
end

function onMobRoam(mob)
	local Path = mob:getLocalVar("Path")
	local Wait = mob:getLocalVar("Wait")
    local flags = tpz.path.flag.RUN
    if os.time() > Wait and Path == 0 then
        mob:pathTo(-17.3861, -8.5, -96.7282, flags)
        mob:setLocalVar("Path", 1)
        mob:setLocalVar("Wait", os.time()+15)
    end
    if os.time() > Wait and Path == 1 then
        mob:pathTo(-34.0422, 0.5, -118.9868, flags)
        mob:setLocalVar("Path", 2)
        mob:setLocalVar("Wait", os.time()+5)
    end
    if os.time() > Wait and Path == 2 then
        mob:pathTo(-51.995, -8.500, -106.498, flags)
        mob:setLocalVar("Path", 0)
        mob:setLocalVar("Wait", os.time()+3)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 383)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
