-----------------------------------
-- Area: Uleguerand Range
--  Mob: Mountain Worm
-----------------------------------
mixins = {require("scripts/mixins/families/worm")}
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobInitialize(mob)
	mob:setMod(tpz.mod.REGEN, 50)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end

function onMobDeath(mob, player, isKiller, noKiller)
end
