-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamia_No18
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller  then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		isKiller:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
