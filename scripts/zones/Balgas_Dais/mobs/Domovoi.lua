-----------------------------------
-- Area: Balgais Dais
--  Mob: Domovoi
-- BCNM: Steamed Sprouts
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
