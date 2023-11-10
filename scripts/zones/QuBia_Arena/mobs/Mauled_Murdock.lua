-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Mauled Murdock
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.HTHRES, 1250)
    mob:setMod(tpz.mod.IMPACTRES, 1250)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId - 2)
    DespawnMob(mobId - 1)
    DespawnMob(mobId + 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
