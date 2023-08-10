-----------------------------------
-- Area: Bostaunieux Oubliette
--  Mob: Werebat
-- Note: PH for Arioch
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 611, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.ARIOCH_PH, 30, 3600) -- 1 hour
end
