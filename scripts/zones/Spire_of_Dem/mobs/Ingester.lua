-----------------------------------
-- Area: Spire of Dem
--  Mob: Neogorger
-- You Are What You Eat
-- !addkeyitem CENSER_OF_ANTIPATHY
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
---------------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setLocalVar("maxBabies", 4)
	local id = mob:getID()
	DespawnMob(id+1)
	DespawnMob(id+2)
	DespawnMob(id+3)
	DespawnMob(id+4)
	mob:delRoamFlag(512)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobEngaged(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobWeaponSkillPrepare(mob, target)
	local fission = 755
	if math.random() < 0.5 then
		return fission
	else
		return 0
	end
	
end

function onMobRoam(mob)
	local terrorEndTime = mob:getLocalVar("EmptyTerror")
	if terrorEndTime == 0 then
		return
	elseif terrorEndTime < os.time() then
		mob:setLocalVar("EmptyTerror",0)
		mob:delRoamFlag(512)
		return
	end
	
	-- scripted run around
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
		mob:disengage()
		local point = {math.random(-249,-230),60.85,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
	
end

function onMobFight(mob, target)
	local terrorEndTime = mob:getLocalVar("EmptyTerror")
	if terrorEndTime == 0 then
		return
	elseif terrorEndTime < os.time() then
		mob:setLocalVar("EmptyTerror",0)
		mob:delRoamFlag(512)
		return
	end
	
	-- scripted run around
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
		mob:disengage()
		local point = {math.random(-249,-230),60.85,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
	
end

function onMobDeath(mob, player, isKiller)
    local momma = mob:getID()
    for i = momma + 1, momma + mob:getLocalVar("maxBabies") do
        local baby = GetMobByID(i)
        if baby:isSpawned() then
            baby:setHP(0)
        end
    end
end
