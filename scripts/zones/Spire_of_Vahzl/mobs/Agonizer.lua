-----------------------------------
-- Area: Spire of Vahzl
--  Mob: Agonizer
require("scripts/globals/pathfind")
require("scripts/globals/promyvion")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 50)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    tpz.promyvion.setEmptyModel(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_LINK, 1)
end

function onMobEngaged(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 20 then
        local nextMob = GetMobByID(mob:getID() + 6) --Cumulator aggros at <20%
        if not nextMob:isEngaged() then
            nextMob:updateEnmity(target)
        end
    end

    if mob:getHPP() <= 25  then
        mob:setMod(tpz.mod.REGAIN, 100)
    end
	
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
		local point = {math.random(-249,-230),60.9,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
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
		local point = {math.random(-249,-230),60.9,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
	
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end
