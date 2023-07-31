-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Sea Puk
-- Note: Place holder Nis Puk
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.NIS_PUK_PH, 20, 3600) -- 1 hours
end
