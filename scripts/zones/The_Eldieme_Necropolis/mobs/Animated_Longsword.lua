------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Gluttony
------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(id, power, 3, duration, subid, subPower)) 
    mob:addStatusEffect(id, power, 3, duration, subid, subPower))
    mob:addStatusEffect(id, power, 3, duration, subid, subPower))
    mob:addStatusEffect(id, power, 3, duration, subid, subPower))
    mob:addStatusEffect(id, power, 3, duration, subid, subPower)) 
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 184)
end


