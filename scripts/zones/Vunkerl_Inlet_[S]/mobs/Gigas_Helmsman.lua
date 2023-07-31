-----------------------------------
-- Area: Vunkerl Inlet [S]
--  Mob: Gigas_Helmsman
-- Note: PH for Big Bang
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PALLAS_PH, 20, 3600) -- 1 hour
end
