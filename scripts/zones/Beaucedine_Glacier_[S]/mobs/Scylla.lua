------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Scylla
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/ruszor")}
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:AnimationSub(0)
end

function onMobWeaponSkill(target, mob, skill)
	local AquaCannonCounter = mob:getLocalVar("AquaCannonCounter")
	local AquaCannonMax = mob:getLocalVar("AquaCannonMax")
	local IceGuillotineCounter = mob:getLocalVar("IceGuillotineCounter")
	local IceGuillotineMax = mob:getLocalVar("IceGuillotineMax")
	local Roll = math.random()
    if skill:getID() == 2439 then -- Hydro Wave
		if Roll < 0.2 then
			AquaCannonMax = 10
		elseif Roll < 0.5 then
			AquaCannonMax = 8
		elseif Roll < 0.7 then
			AquaCannonMax = 6
		else Roll < 0.8 then
			AquaCannonMax = 4
		end
		mob:setLocalVar("AquaCannonMax", AquaCannonMax)
	end
	
	if AquaCannonMax > 0 then
		if AquaCannonCounter > AquaCannonMax then
			mob:setLocalVar("AquaCannonCounter", 0)
			mob:setLocalVar("AquaCannonMax", 0)
			mob:delStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.SILENCE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		else
			mob:useMobAbility(2441) -- Aqua Cannon
			AquaCannonCounter = AquaCannonCounter + 1
			mob:setLocalVar("AquaCannonCounter", AquaCannonCounter)
		end
	end

    if skill:getID() == 2438 then -- Frozen Mist
		if Roll < 0.2 then
			IceGuillotineMax = 10
		elseif Roll < 0.5 then
			IceGuillotineMax = 8
		elseif Roll < 0.7 then
			IceGuillotineMax = 6
		else Roll < 0.8 then
			IceGuillotineMax = 4
		end
		mob:setLocalVar("IceGuillotineMax", IceGuillotineMax)
	end

	  if IceGuillotineMax > 0 then
		if IceGuillotineCounter > IceGuillotineMax then
			mob:setLocalVar("IceGuillotineCounter", 0)
			mob:setLocalVar("IceGuillotineMax", 0)
			mob:delStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.PARALYSIS, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		else
			mob:useMobAbility(2440) -- Ice Guillotine
			IceGuillotineCounter = IceGuillotineCounter + 1
			mob:setLocalVar("IceGuillotineCounter", IceGuillotineCounter)
		end
	end
end


function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SCYLLA_SKINNER)
    tpz.hunts.checkHunt(mob, player, 539)
end
