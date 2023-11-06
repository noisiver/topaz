-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Shredded Samson
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMod(tpz.mod.SLASHRES, 1250)
	mob:setMod(tpz.mod.PIERCERES, 1250)
    mob:setMod(tpz.mod.RANGEDRES, 1250)
	mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId - 1)
    DespawnMob(mobId + 1)
    DespawnMob(mobId + 2)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
