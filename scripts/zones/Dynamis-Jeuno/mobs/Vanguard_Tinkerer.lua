-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Tinkerer
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BANDRIX_ROCKJAW_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller)
end
