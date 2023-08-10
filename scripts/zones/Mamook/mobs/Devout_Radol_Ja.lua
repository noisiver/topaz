-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 40)
	mob:setMod(tpz.mod.REGEN, 2)
end

function onMobFight(mob, target)
	if mob:getHPP() <= 75 then
		mob:setMod(tpz.mod.ATTP, 12)
		mob:setMod(tpz.mod.DEFP, 12) 
		mob:setMod(tpz.mod.REGEN, 12)
	end
	if mob:getHPP() <= 50 then
		mob:setMod(tpz.mod.ATTP, 25)
		mob:setMod(tpz.mod.DEFP, 25) 
		mob:setMod(tpz.mod.REGEN, 25)
	end
	if mob:getHPP() <= 25 then
		mob:setMod(tpz.mod.ATTP, 50)
		mob:setMod(tpz.mod.DEFP, 50) 
		mob:setMod(tpz.mod.REGEN, 50)
	end
end

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

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
