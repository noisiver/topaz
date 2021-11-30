------------------------------
-- Area: Mamook
--   NM: Hundredfaced Hapool Ja
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(120) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.REGAIN, 150)
     tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MIJIN_GAKURE, cooldown = 45, hpp = 100},
        },
     })
end

function onSpellPrecast(mob, spell)
	local target = mob:getTarget()
    local Guard = GetMobByID(17043666)
    local GuardTwo = GetMobByID(17043667)
    local GuardThree = GetMobByID(17043668)
    local GuardFour = GetMobByID(17043669)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
	if (spell:getID() == 339) then -- Utsusemi: Ni
		Guard:spawn()
        GuardTwo:spawn()
        GuardThree:spawn()
        GuardFour:spawn()
		Guard:updateEnmity(target)
        GuardTwo:updateEnmity(target)
        GuardThree:updateEnmity(target)
        GuardFour:updateEnmity(target)
		Guard:setPos(X, Y, Z)
		Guard:setSpawn(X, Y, Z)
		GuardTwo:setPos(X, Y, Z)
		GuardTwo:setSpawn(X, Y, Z)
		GuardThree:setPos(X, Y, Z)
		GuardThree:setSpawn(X, Y, Z)
		GuardFour:setPos(X, Y, Z)
		GuardFour:setSpawn(X, Y, Z)
	end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 461)
    DespawnMob(Guard)
    DespawnMob(GuardTwo)
    DespawnMob(GuardThree)
    DespawnMob(GuardFour)
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
