-----------------------------------
-- Area: Spire of Holla
--  Mob: Cogitator
-- Simulant
-- !addkeyitem CENSER_OF_ABANDONMENT
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end