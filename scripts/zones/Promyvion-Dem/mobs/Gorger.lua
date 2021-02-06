-----------------------------------
-- Area: Promyvion-Dem
--  MOB: Gorger
-----------------------------------
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
end

function onMobDeath(mob, player, isKiller)
end