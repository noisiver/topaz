-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Duu Masa the Onecut
-- SAM/SAM
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Always up, not lotto.
-- Uses: Parry, Feathered Furore, Double Kick, Feather Storm
-- Uses Meikyo Shisui
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end
function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
