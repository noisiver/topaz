-----------------------------------
-- Area: Giddeus (145)
--   NM: Juu Duzu the Whirlwind
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 280)
end
