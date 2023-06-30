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

function onMobDespawn(mob)
    mob:setLocalVar("respawn", os.time() + 43200) -- 12 hour respawn
end

function onMobDeath(mob, player, isKiller)
end
