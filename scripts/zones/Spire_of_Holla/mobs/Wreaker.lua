-----------------------------------
-- Area: Spire of Holla
--  Mob: Wreaker
require("scripts/globals/pathfind")
require("scripts/globals/promyvion")
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/empty")}
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    tpz.promyvion.setEmptyModel(mob)
	mob:delRoamFlag(512)
    mob:setDamage(50)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobEngaged(mob,target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobWeaponSkillPrepare(mob, target)
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
		local point = {math.random(-249,-230),-59.15,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
	
end

function onMobFight(mob,target)
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
		local point = {math.random(-249,-230),60.85,math.random(-8,10)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
	
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.promyvion.onEmptyDeath(mob)
end
