-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Praetor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Quicksand_Caves/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 50)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 200)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 150)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17629640)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local legatus = GetMobByID(ID.mob.ANTICAN_LEGATUS)
    if GetMobByID(ID.mob.ANTICAN_CONSUL):isDead() and GetMobByID(ID.mob.ANTICAN_PRAETOR):isDead() then
        legatus:setLocalVar("Guards", 0)
    end
end
