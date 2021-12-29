-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Armorer
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ELIXMIX_HOOKNOSE_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.CLOKTIX_LONGNAIL_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller)
end
