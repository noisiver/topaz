-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 735, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.AMEMET_PH, 30, 7200) -- 2 hours
end
