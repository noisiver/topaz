-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Loo Kutto the Pensive
-- SAM/SAM
-- Immune to Sleep, Bind, Gravity, Break
-- TP Move Timer:  1:34 - > 1:41 - > 1:54 - > 02:05 - > 02:18 - > 02:30 - > 02:54 - > 02:59 - > 03:18 - > 03:27 - > 03:42
-- TP Move timer reduces to 5s at 49% HP
-- Uses Sweep, Feathered Furore, Double Kick, Feather Storm. Can use Meikyo Shisui starting at 49%
-- Used Mekiyo Shisui at 55%
-- Uses Dark Invocation x3 during Meikyio Shisui
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
