-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Wivre
-- Note: 
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
 end

function onMobDeath(mob, player, isKiller)
end


