-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Marquis Forneus
-- DRK/DRK
-- Immune to Silence, Paralyze, Sleep, Bind, Grabity, Break
-- Extremely high weapon damage and attack. Hit me for 600 naked, and hit me for 250 with 462 defense
-- High ACC
-- En-absorb(No msg in chat log). Not 100% proc
-- Cannot miss dark absorbs.
-- Casts Drain, Aspir, Stun, Dread Spikes, and Absorb Spells.
-- Cast Timer: 
-- 100% - 50%: 30s
-- 50% - 25: 15s
-- 25% - 0: 10s
-- Uses: Soul Drain, Condemnation, Hecatomb Wave, Demonic Howl
-- Uses Blood Weapon sometime below 50% HP
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(18000, 21600)) -- 5 to 6 hours
end
