------------------------------
-- Area: Xarcabard [S]
--   NM: Zirnitra
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/pathfind")
mixins = {require("scripts/mixins/families/amphiptere")}
------------------------------
local path1 = {
    92, -36, 150,
    -1, -36, 159,
    -3, -36, 65,
    -78, -36, 62,
    -113, -35, 64,
    -120, -36, 123,
	-134, -28, 85,
}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:addMod(tpz.mod.MOVE, 20)
    mob:addMod(tpz.mod.WIND_ABSORB, 100)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
    onPath(mob)
end

function onMobRoam(mob)
    onPath(mob)
end

function onMobWeaponSkill(target, mob, skill)
	local HP = mob:getHPP()
    if skill:getID() == 2427 or skill:getID() == 2428 or skill:getID() == 2429 or skill:getID() == 2430 or skill:getID() == 2431  or skill:getID() == 2432 or skill:getID() == 2433  then
        mob:resetEnmity(target)        
    end
	
	if HP <= 25 then
		if skill:getID() == 2431 then -- Reaving Wind
			local ReavingWindCounter = mob:getLocalVar("ReavingWindCounter")
			local ReavingWindMax = mob:getLocalVar("ReavingWindMax")
			local CalamitousWindCounter = mob:getLocalVar("CalamitousWindCounter")
			local CalamitousWindMax = mob:getLocalVar("CalamitousWindMax")
			
			if ReavingWindCounter == 0 and ReavingWindMax == 0 then
				ReavingWindMax = math.random(1, 3)
				mob:setLocalVar("ReavingWindMax", ReavingWindMax)
			end

			ReavingWindCounter = ReavingWindCounter + 1
			CalamitousWindCounter = CalamitousWindCounter + 1
			mob:setLocalVar("ReavingWindCounter", ReavingWindCounter)
			mob:setLocalVar("CalamitousWindCounter", CalamitousWindCounter)

			if ReavingWindCounter > ReavingWindMax then
				mob:setLocalVar("ReavingWindCounter", 0)
				mob:setLocalVar("ReavingWindMax", 0)
			else
				mob:useMobAbility(2431) -- Reaving Wind
			end
		end
		if ReavingWindCounter == 0 and CalamitousWindCounter > 0 then
			mob:useMobAbility(2433) -- Calamitous Wind
			CalamitousWindCounter = CalamitousWindCounter -1
			mob:setLocalVar("CalamitousWindMax", CalamitousWindCounter)
		end
	end
end

function onMonsterMagicPrepare(mob, target)
    return 359 -- Silencega
end

function onPath(mob)
	tpz.path.patrolsimple(mob, path1, tpz.path.flag.RUN)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(14400, 18000)) -- 4 to 5 hours
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ZIRNITRA_WINGCLIPPER)
    tpz.hunts.checkHunt(mob, player, 543)
end


