-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Marquis Andras
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UDMGBREATH, -25)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
