-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Great Ameretat
-- Note: PH for Jaded Jody
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.JADED_JODY_PH, 20, 7200) -- 2 hours
end
