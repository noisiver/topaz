-----------------------------------
-- Area: Spire of Dem
--  Mob: Neogorger
-- You Are What You Eat
-- !addkeyitem CENSER_OF_ANTIPATHY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end