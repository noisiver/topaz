-----------------------------------
-- Area: Mamook
--  Mob: Watch Wyvern
-- Note: PH for Firedance Magmaal Ja
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.FIREDANCE_MAGMAAL_JA_PH, 20, 3600) -- 1 hour
end
