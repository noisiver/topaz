-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Praetor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17629640)
end

function onMobDeath(mob, player, isKiller)
end
