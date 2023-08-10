-----------------------------------
-- Area: Lufaise Meadows
--  Mob: Colorful Leshy
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobInitialize(mob)
    mob:setLocalVar("timeToGrow", os.time() + math.random(36000, 43200)) -- Colorful in 11 to 12 hours
end

function disturbMob(mob)
    GetMobByID(mob:getID() + 1):setLocalVar("timeToGrow", os.time() + math.random(36000, 43200)) -- Defoliate in 11 to 12 hours
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    disturbMob(mob)
end

function onMobEngaged(mob, target)
    disturbMob(mob)
end

function onMobFight(mob, target)
    disturbMob(mob)
end

function onMobRoam(mob)
    local ph = mob:getID()
    local nm = GetMobByID(ph + 1)
    if (not nm:isSpawned() and os.time() > nm:getLocalVar("timeToGrow")) then
        local phIndex = mob:getLocalVar("phIndex")
        local p = mob:getPos()
        DisallowRespawn(ph, true)
        mob:setLocalVar("phIndex", 0)
        DespawnMob(ph)

        DisallowRespawn(ph + 1, false)
        nm:setSpawn(p.x, p.y, p.z, p.rot)
        SpawnMob(ph + 1)
        nm:setLocalVar("phIndex", phIndex)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local phIndex = mob:getLocalVar("phIndex")
    if (phIndex ~= 0) then
        mob:setLocalVar("phIndex", 0)
        DisallowRespawn(mob:getID(), true)
        DisallowRespawn(phIndex, false)
        GetMobByID(phIndex):setRespawnTime(GetMobRespawnTime(phIndex))
        mob:setLocalVar("timeToGrow", os.time() + math.random(3200, 43200)) -- Colorful in 12 to 24 hours
    end
end
