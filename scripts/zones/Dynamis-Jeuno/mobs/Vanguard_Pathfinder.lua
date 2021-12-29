-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Pathfinder
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PROWLOX_BARRELBELLY_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller)
end
