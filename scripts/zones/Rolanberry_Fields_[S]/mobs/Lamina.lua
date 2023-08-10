-----------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Lamina
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
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
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SLOW)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 510)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 minutes
end
