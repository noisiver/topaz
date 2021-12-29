-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Dragontamer
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.RUTRIX_HAMGAM_PHS, 50, 3600) -- 20 minutes
end


function onMobDeath(mob, player, isKiller)
end
