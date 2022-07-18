-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Hitman
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.TUFFLIX_LOGLIMBS_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.EREMIX_SNOTTYNOSTRIL_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller)
end
