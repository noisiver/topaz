-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Beelzebub 
-- BCNM: Infernal Swarm
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.SLEEPRESTRAIT, 75)
     mob:setMod(tpz.mod.REFRESH, 400)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller)
end
