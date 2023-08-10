-----------------------------------
-- Area: Sauromugue Champaign [S]
--   NM: Hyakinthos
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.EVA, 25)
    mob:addMod(tpz.mod.ACC, 25)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local PetalTime = mob:getLocalVar("PetalTime")

    if PetalTime == 0 then
        mob:setLocalVar("PetalTime", math.random(15, 20))
    elseif battletime >= PetalTime then
        mob:useMobAbility(2210) -- Petal Pirouette
        mob:setLocalVar("PetalTime", battletime + math.random(15,20))
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {chance = 50}) -- "Attacks have Additional Effect: Paralyze, which has a high proc rate."
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 530)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 minutes
end
