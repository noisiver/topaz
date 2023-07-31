-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Annihilated Anthony
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 50) 
	mob:addMod(tpz.mod.ATTP, 50)
	mob:addMod(tpz.mod.ACC, 50) 
	mob:addMod(tpz.mod.EVA, 25)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    mob:setMod(tpz.mod.SLASHRES, 250)
    mob:setMod(tpz.mod.UDMGMAGIC, 150)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId + 1)
    DespawnMob(mobId + 2)
    DespawnMob(mobId + 3)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
