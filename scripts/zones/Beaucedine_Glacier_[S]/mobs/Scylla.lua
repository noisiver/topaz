------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Scylla
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/titles")
mixins = {require("scripts/mixins/families/ruszor")}
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
	mob:setDamage(140)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25)
	mob:setMod(tpz.mod.VIT, 69)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMod(tpz.mod.HUMANOID_KILLER, 25)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:AnimationSub(0)
end

function onMobFight(mob, target)
	local AquaCannonTime = mob:getLocalVar("AquaCannonTime")
	local AquaCannonMax = mob:getLocalVar("AquaCannonMax")
	local IceGuillotineMax = mob:getLocalVar("IceGuillotineMax")
	local IceGuillotineTime = mob:getLocalVar("IceGuillotineTime")
    -- Use Aqua Cannon 4/6/8/10 times in a row after using Hydro Wave
    if (AquaCannonTime == 1) then
	    if (AquaCannonMax == 10) then
		    mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
	    elseif (AquaCannonMax == 8) then
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
	    elseif (AquaCannonMax == 6) then
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
	    elseif (AquaCannonMax == 4) then
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
            mob:useMobAbility(2441) -- Aqua Cannon
	    end
        mob:setLocalVar("AquaCannonTime", 0)
    end
    -- Use Ice Guillotine 4/6/8/10 times in a row after using Frozen mst
    if (IceGuillotineTime == 1) then
	    if (IceGuillotineMax == 10) then
		    mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
	    elseif (IceGuillotineMax == 8) then
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
	    elseif (IceGuillotineMax == 6) then
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
	    elseif (IceGuillotineMax == 4) then
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
            mob:useMobAbility(2440) -- Ice Guillotine
	    end
        mob:setLocalVar("IceGuillotineTime", 0)
    end
end

function onMobWeaponSkill(target, mob, skill)
	local Roll = math.random()
    if skill:getID() == 2439 then -- Hydro Wave
        mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 300, tpz.effect.MUTE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		if Roll < 0.2 then
			AquaCannonMax = 10
		elseif Roll < 0.5 then
			AquaCannonMax = 8
		elseif Roll < 0.7 then
			AquaCannonMax = 6
		else 
			AquaCannonMax = 4
		end
		mob:setLocalVar("AquaCannonMax", AquaCannonMax)
        mob:setLocalVar("AquaCannonTime", 1)
	end
	
    if skill:getID() == 2438 then -- Frozen Mist
        mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 300, tpz.effect.GEO_PARALYSIS, 50, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		if Roll < 0.2 then
			IceGuillotineMax = 10
		elseif Roll < 0.5 then
			IceGuillotineMax = 8
		elseif Roll < 0.7 then
			IceGuillotineMax = 6
		else
			IceGuillotineMax = 4
		end
		mob:setLocalVar("IceGuillotineMax", IceGuillotineMax)
        mob:setLocalVar("IceGuillotineTime", 1)
	end
end


function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SCYLLA_SKINNER)
    tpz.hunts.checkHunt(mob, player, 539)
end
