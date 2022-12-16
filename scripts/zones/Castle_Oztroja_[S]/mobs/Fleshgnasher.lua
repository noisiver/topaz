-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Fleshgnasher
-- THF/THF
-- Immune to Sleep, Bind, Gravity, Break
-- 150 Regain
-- 2s delay(half normal mobs)
-- 100% HP: :50 - > :25
-- Uses: Pandemic Nip, Insipid Nip, Cimicine Discharge, Bombilation
-- Uses(Below 33%): Emetic Discharge and the above.
-- Uses Perfect Doege sometime below 50% HP
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
