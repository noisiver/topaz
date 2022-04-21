-----------------------------------
-- Area: Manaclipper
--  Mob: Zoredonite
-----------------------------------
mixins =
{
require("scripts/mixins/families/uragnite"),
require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 10)
    mob:addMod(tpz.mod.EVA, 10)
end

function onMobDeath(mob, player, isKiller)
end
