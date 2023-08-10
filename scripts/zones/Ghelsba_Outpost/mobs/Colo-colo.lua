-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Colo-colo
-- BCNM: Wings of Fury
-- !additem cloudy_orb
-- !pos -165.357 -11.672 77.771 140
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob, target)
    mob:setMobMod(tpz.mobMod.MAGIC_DELAY, 10)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end