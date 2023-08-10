-----------------------------------
-- Area: Batallia Downs [S]
--  Mob: Goblin Blastmaster
-- Note: PH for Burlibix Brawnback
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BURLIBIX_BRAWNBACK_PH, 20, 10800) -- 3 hours
end
