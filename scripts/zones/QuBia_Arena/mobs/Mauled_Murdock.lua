-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Mauled Murdock
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 20) 
	mob:addMod(tpz.mod.ATTP, 10)
	mob:addMod(tpz.mod.ACC, 30) 
	mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    mob:setMod(tpz.mod.HTHRES, 1250)
    mob:setMod(tpz.mod.IMPACTRES, 1250)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId - 2)
    DespawnMob(mobId - 1)
    DespawnMob(mobId + 1)
end

function onMobDeath(mob, player, isKiller)
end
