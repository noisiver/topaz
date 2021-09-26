-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Marid
-- Note: Place holder Mahishasura and Grand Marids
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/marid")}

function onMobDeath(mob, player, isKiller)
	if mob:AnimationSub() >= 1 then
		if math.random(1,100) <= 10 then 
			player:addTreasure(2147, mob) --Marid Tusk
		end
		if mob:AnimationSub() == 2 then
			if math.random(1,100) <= 24 then 
				player:addTreasure(2147, mob) --Marid Tusk
			end
		end
	end

	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	 end
end



function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MAHISHASURA_PH, 20, 10800) -- 3 hours
    tpz.mob.phOnDespawn(mob, ID.mob.GRAND_MARID1_PH, 20, 1800)
    tpz.mob.phOnDespawn(mob, ID.mob.GRAND_MARID2_PH, 20, 1800)
end


