-----------------------------------
-- Area: Caedarva Mire
--  Mob: Jnun
-----------------------------------
mixins = {require("scripts/mixins/families/jnun")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end