-----------------------------------
-- Area: La Vaule [S]
--   NM: Rugaroo
-- Para/Bind/Grav/Sleep immunity
-- Hits twice(Like a MNK)
-- Kick Attacks
-- Five call to the moons into Asuran Fists
-- Perma 20%+ humanoid killer after call of the moon.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/families/gnole")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end