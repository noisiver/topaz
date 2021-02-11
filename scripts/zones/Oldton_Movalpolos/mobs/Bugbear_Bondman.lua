-----------------------------------
-- Area: Oldton Movalpolos
--  Mob: Bugbear Bondman
-- Note: PH for Bugbear Strongman
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.BUGBEAR_STRONGMAN_PH, 30, 1) -- no cooldown
end
