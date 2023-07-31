-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Farlarder the Shrewd
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
--------------------------------------------------

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
