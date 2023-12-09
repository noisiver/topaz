-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  Mob: Archaic Gear
-- !pos -19 -4 -153
-----------------------------------
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end