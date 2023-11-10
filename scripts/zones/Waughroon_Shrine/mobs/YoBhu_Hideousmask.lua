-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Yo'Bhu Hideousmask
-- BCNM: Grimshell Shocktroopers
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
