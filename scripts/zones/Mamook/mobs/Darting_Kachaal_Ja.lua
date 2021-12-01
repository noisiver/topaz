-----------------------------------
-- Area: Mamook
--  Mob: Darting Kachaal Ja
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
	mob:SetAutoAttackEnabled(true)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 1)
end

function onMobFight(mob, target)
	local StunTime = mob:getLocalVar("StunTime")
	local RunAwayTime = mob:getLocalVar("RunAwayTime")
	local RunBackTime = mob:getLocalVar("RunAwayTime")
	local RunAwayPath = mob:getLocalVar("RunBackTime")
	local BattleTime = mob:getBattleTime()
	
	if RunAwayTime == 0 then
		mob:setLocalVar("RunAwayTime", BattleTime + 45)
	elseif BattleTime >= RunAwayTime and RunAwayPath == 0 then
		mob:castSpell(274) -- sleepga II
		mob:pathTo(-205, 18, -367)
		mob:setLocalVar("RunBackTime", BattleTime + 45)
		mob:setLocalVar("RunAwayPath", 1)
	end
	
	if BattleTime >= RunBackTime and RunAwayPath == 1 then
		mob:castSpell(362) -- bindga
		mob:pathTo(38, 17, -391)
		mob:setLocalVar("RunAwayTime", BattleTime + 45)
		mob:setLocalVar("RunAwayPath", 0)
	end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

function onMobDeath(mob, player, isKiller)
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
