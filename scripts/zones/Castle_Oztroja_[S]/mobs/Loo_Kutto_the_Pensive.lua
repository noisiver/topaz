-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Loo Kutto the Pensive
-- SAM/SAM
-- Immune to Sleep, Bind, Grabity, Break
-- TP Move Timer:  1:34 - > 1:41 - > 1:54 - > 02:05 - > 02:18 - > 02:30 - > 02:54 - > 02:59 - > 03:18 - > 03:27 - > 03:42
-- TP Move timer reduces to 5s at 49% HP
-- Uses Sweep, Feathered Furore, Double Kick, Feather Storm. Can use Meikyo Shisui starting at 49%
-- Used Mekiyo Shisui at 55%
-- Uses Dark Invocation x3 during Meikyio Shisui
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
