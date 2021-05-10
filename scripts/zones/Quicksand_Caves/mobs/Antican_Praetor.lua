-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Praetor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Quicksand_Caves/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 200)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 150)
end

function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17629640)
end

function onMobDeath(mob, player, isKiller)
end
