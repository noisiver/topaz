-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Ladybug
-- Note: PH for Skogs Fru
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobRoam(mob)
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
		mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
    else
		mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SKOGS_FRU_PH, 20, 3600) -- 1 hour
end
