-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Duu Masa the Onecut
-- SAM/SAM
-- Immune to Paralyze, Sleep, Bind, Grabity, Break
-- Always up, not lotto.
-- Uses: Parry, Feathered Furore, Double Kick, Feather Storm
-- Uses Meikyo Shisui
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
