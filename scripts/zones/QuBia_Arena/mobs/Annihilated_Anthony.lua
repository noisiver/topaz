-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Annihilated Anthony
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.SLASHRES, 250)
    mob:setMod(tpz.mod.UDMGMAGIC, 150)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId + 1)
    DespawnMob(mobId + 2)
    DespawnMob(mobId + 3)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
