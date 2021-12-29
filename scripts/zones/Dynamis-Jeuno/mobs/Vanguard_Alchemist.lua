-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Alchemist
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.WYRMWIX_SNAKESPECS_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.DISTILIX_STICKYTOES_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller)
end
