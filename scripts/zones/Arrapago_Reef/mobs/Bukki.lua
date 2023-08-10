-----------------------------------
-- Area: Arrapago Reef
--   NM: Bukki
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
