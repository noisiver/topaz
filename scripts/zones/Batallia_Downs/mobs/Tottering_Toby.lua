-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Tottering Toby
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 161)
end
