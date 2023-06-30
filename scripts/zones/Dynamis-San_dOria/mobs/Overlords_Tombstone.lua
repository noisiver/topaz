-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Overlord's Tombstone
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:delImmunity(tpz.immunity.STUN)
    mob:delImmunity(tpz.immunity.PARALYZE)
    mob:delImmunity(tpz.immunity.BLIND)
    mob:delImmunity(tpz.immunity.POISON)
end

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
