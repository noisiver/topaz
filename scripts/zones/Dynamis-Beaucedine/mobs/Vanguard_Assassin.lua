-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Vanguard Assassin
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Beaucedine/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.KUU_XUKA_THE_NIMBLE_PH, 50, 3600) -- 20 minutes
end
