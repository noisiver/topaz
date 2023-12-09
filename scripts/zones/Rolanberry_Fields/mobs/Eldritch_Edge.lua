------------------------------
-- Area: Rolanberry Fields
--   NM: Eldritch Edge
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.STORETP, 100)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 218)
end
