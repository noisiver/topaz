-----------------------------------
-- Area: Attohwa Chasm
--   NM: Sekhmet
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMod(tpz.mod.FASTCAST, 15)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.MP_DRAIN, {power = math.random(1, 10)})
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 276)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400, 7200)) -- 1.5 to 2 hours.
    UpdateNMSpawnPoint(mob:getID())
end
