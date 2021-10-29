------------------------------
-- Area: Beaucedine Glacier [S]
--   NM: Scylla
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:AnimationSub(0)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2439 then -- Hydro Wave
        local AquaCannonCounter = mob:getLocalVar("AquaCannonCounter")
        local AquaCannonMax = mob:getLocalVar("AquaCannonMax")
        local IceGuillotineCounter = mob:getLocalVar("IceGuillotineCounter")
        local IceGuillotineMax = mob:getLocalVar("IceGuillotineMax")
		
        if AquaCannonCounter == 0 and AquaCannonMax == 0 then
            AquaCannonMax = math.random(4, 10)
            mob:setLocalVar("AquaCannonMax", AquaCannonMax)
        end

        AquaCannonCounter = AquaCannonCounter + 1
        mob:setLocalVar("AquaCannonCounter", AquaCannonCounter)

        if AquaCannonCounter > AquaCannonMax then
            mob:setLocalVar("AquaCannonCounter", 0)
            mob:setLocalVar("AquaCannonMax", 0)
			mob:delStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.SILENCE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
			mob:delStatusEffec(tpz.effect.PROWESS)
        else
            mob:useMobAbility(2441) -- Aqua Cannon
        end
    end
	
    if skill:getID() == 2438 then -- Frozen Mist
        local IceGuillotineCounter = mob:getLocalVar("IceGuillotineCounter")
        local IceGuillotineMax = mob:getLocalVar("IceGuillotineMax")

        if IceGuillotineCounter == 0 and IceGuillotineMax == 0 then
            IceGuillotineMax = math.random(4, 10)
            mob:setLocalVar("IceGuillotineMax", IceGuillotineMax)
        end

        IceGuillotineCounter = IceGuillotineCounter + 1
        mob:setLocalVar("IceGuillotineCounter", IceGuillotineCounter)

        if IceGuillotineCounter > IceGuillotineMax then
            mob:setLocalVar("IceGuillotineCounter", 0)
            mob:setLocalVar("IceGuillotineMax", 0)
			mob:delStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.PARALYSIS, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
			mob:delStatusEffec(tpz.effect.PROWESS)
        else
            mob:useMobAbility(2440) -- Ice Guillotine
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SCYLLA_SKINNER)
    tpz.hunts.checkHunt(mob, player, 539)
end
