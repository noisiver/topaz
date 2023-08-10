-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Demon Warlock
-- Note: PH for Viscount Morax
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Keep/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VISCOUNT_MORAX_PH, 30, 3600)
end
