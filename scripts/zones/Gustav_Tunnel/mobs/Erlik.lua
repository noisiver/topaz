-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Erlik
-- Note: Place holder Baobhan Sith
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 767, 2, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BAOBHAN_SITH_PH, 30, math.random(36000, 43200)) --10 to 12 hours
end
