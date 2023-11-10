-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Vaicoliaux B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 15)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
