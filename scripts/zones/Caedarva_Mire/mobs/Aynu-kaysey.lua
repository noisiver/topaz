-----------------------------------
-- Area: Caedarva Mire
--   NM: Aynu-kaysey
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
    mob:setMod(tpz.mod.STORETP, 50)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 470)
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

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
