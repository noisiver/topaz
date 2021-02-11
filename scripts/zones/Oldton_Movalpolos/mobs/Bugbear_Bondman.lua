-----------------------------------
-- Area: Oldton Movalpolos
--  Mob: Bugbear Bondman
-- Note: PH for Bugbear Strongman
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if not tpz.mob.phOnDespawn(mob, ID.mob.WEST_BONDMAN, 50, 600) or tpz.mob.phOnDespawn(mob, ID.mob.EAST_BONDMAN, 50, 600) then -- 10m
        tpz.mob.phOnDespawn(mob, ID.mob.BUGBEAR_STRONGMAN_PH, 20, 1) -- no cooldown
    end
end
