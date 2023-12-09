------------------------------
-- Area: Alzadaal Undersea Ruins
--  Mob: Archaic Gears
-- !pos -19 -4 -153
-----------------------------------
mixins = {require("scripts/mixins/families/gears")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end