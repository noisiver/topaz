------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Scylla
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/wotg")
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
    mob:setMod(tpz.mod.WATER_ABSORB, 100)
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
    local MuteAura = mob:getLocalVar("MuteAura")
    local ParalysisAura = mob:getLocalVar("ParalysisAura")

    -- Use Aqua Cannon 4/6/8/10 times in a row after using Hydro Wave
    if (AquaCannonTime == 1) then
        UseMultipleTPMoves(mob, AquaCannonMax, 2441)
        mob:setLocalVar("AquaCannonTime", 0)
    end
    -- Use Ice Guillotine 4/6/8/10 times in a row after using Frozen mst
    if (IceGuillotineTime == 1) then
        UseMultipleTPMoves(mob, IceGuillotineMax, 2440)
        mob:setLocalVar("IceGuillotineTime", 0)
    end
    -- Gains an aura after using Hydro Wave and Frozen Mist
    if (os.time() < MuteAura) then
        AddMobAura(mob, target, 10, tpz.effect.MUTE, 1, 3)
    end
    if (os.time() < ParalysisAura) then
        AddMobAura(mob, target, 10, tpz.effect.GEO_PARALYSIS, 50, 3)
    end
end

function onMobWeaponSkill(target, mob, skill)
	local Roll = math.random()
    if skill:getID() == 2439 then -- Hydro Wave
        mob:setLocalVar("MuteAura", os.time() + 300)
        mob:setLocalVar("ParalysisAura", 0)
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
        mob:setLocalVar("ParalysisAura", os.time() + 300)
        mob:setLocalVar("MuteAura", 0)
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


function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.SCYLLA_SKINNER)
    tpz.hunts.checkHunt(mob, player, 539)
    tpz.wotg.MagianT4(mob, player, isKiller)
end
