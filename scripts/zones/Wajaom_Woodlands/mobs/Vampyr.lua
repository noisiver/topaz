-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Vampyr
-----------------------------------

-----------------------------------

function onMobDeath(mob, player, isKiller)
	if isKiller and math.random(1,100) <= 24 then 
		killer:addTreasure(5735, mob)--Cotton Coin Purse
	end
end