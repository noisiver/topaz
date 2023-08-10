-----------------------------------
-- Area: Promyvion - Vahzl
--  MOB: Weeper
-----------------------------------
require("scripts/globals/promyvion")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end