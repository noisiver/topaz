-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Serjeant Tombstone
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobSpawn(mob)
    dynamis.refillStatueOnSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    dynamis.refillStatueRestore(mob, player, isKiller)
end

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.refillStatueOnDeath(mob, player, isKiller)
end
