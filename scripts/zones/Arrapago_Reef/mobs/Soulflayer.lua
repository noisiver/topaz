-----------------------------------
-- Area: Arrapago Reef
--  Mob: Soulflayer
-----------------------------------

-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end