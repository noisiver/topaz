-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Skoffin
-----------------------------------

local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
