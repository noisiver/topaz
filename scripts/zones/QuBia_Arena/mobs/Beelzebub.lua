-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Beelzebub 
-- BCNM: Infernal Swarm
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
     SetGenericNMStats(mob)
     mob:setMod(tpz.mod.EEM_SILENCE, 30)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
