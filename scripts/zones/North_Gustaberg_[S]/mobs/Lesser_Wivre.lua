-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Lesser Wivre
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
 end
 
function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
