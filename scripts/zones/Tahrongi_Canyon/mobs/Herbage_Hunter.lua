------------------------------
-- Area: Tahrongi Canyon
--   NM: Herbage Hunter
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 259)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
 end