-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Praetor
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Quicksand_Caves/IDs")
-----------------------------------
function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17629640)
end

function onMobDeath(mob, player, isKiller)
end
