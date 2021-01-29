-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Bo'Who Warmonger
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 60, 1, tpz.regime.type.FIELDS)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
   -- mob:setRespawnTime(75600 + math.random(600, 900)) -- 21 hours, plus 10 to 15 min
   mob:setRespawnTime(3600) -- 1 hour
end
