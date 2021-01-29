------------------------------
-- Area: The Eldieme Necropolis
--   Animated Longsword(RDM)
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(protect_V, 1, 0, 3600)
    mob:addStatusEffect(shell_V, 1, 0, 3600)
    mob:addStatusEffect(phalanx, 1, 0, 180)
    mob:addStatusEffect(temper, 1, 0, 180)
    mob:addStatusEffect(haste_II, 1, 0, 180)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 184)
end


