-----------------------------------
-- Area: Davoi
--  Mob: War Lizard
-- Note: PH for Tigerbane Bakdak
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.TIGERBANE_BAKDAK_PH, 30, 3600) -- 1 hour
end
