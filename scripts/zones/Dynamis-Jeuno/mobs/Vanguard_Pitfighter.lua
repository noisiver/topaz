-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Pitfighter
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
    tpz.mob.phOnDespawn(mob, ID.mob.BOOTRIX_JAGGEDELBOW_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller, noKiller)
end
