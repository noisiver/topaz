-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Fleshgnasher
-- THF/THF
-- Immune to Sleep, Bind, Grabity, Break
-- 150 Regain
-- 2s delay(half normal mobs)
-- 100% HP: :50 - > :25
-- Uses: Pandemic Nip, Insipid Nip, Cimicine Discharge, Bombilation
-- Uses(Below 33%): Emetic Discharge and the above.
-- Uses Perfect Doege sometime below 50% HP
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
