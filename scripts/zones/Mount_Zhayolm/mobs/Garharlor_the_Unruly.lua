-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garharlor_the_Unruly
-----------------------------------
mixins = {
require("scripts/mixins/weapon_break")
require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
     mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobDeath(mob)
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
