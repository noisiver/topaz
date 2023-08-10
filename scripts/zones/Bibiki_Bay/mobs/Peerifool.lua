------------------------------
-- Area: Bibiki Bay (Purgonorgo Isle)
--   Mob: Peerifool
--  Quest:  One Good Deed
------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobRoam(mob)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local DreamFlowerTime = mob:getLocalVar("DreamFlowerTime")

    -- Use Dream Flower rapidly, often within seconds of each other when they are awake
    if DreamFlowerTime == 0 then
        mob:setLocalVar("DreamFlowerTime", math.random(15, 30))
    elseif battletime >= DreamFlowerTime then
        mob:useMobAbility(301) -- Dream Flower
        mob:setLocalVar("DreamFlowerTime", battletime + math.random(15,30))
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SLEEP) 
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- All Perifools are dead
    if GetMobByID(16793711):isDead() and GetMobByID(16793712):isDead() and GetMobByID(16793713):isDead() and
    GetMobByID(16793714):isDead() and GetMobByID(16793715):isDead() and GetMobByID(16793716):isDead() then
        player:setCharVar("OneGoodDeed", 2)
    end
end

function onMobDespawn(mob)
end