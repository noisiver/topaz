-----------------------------------
-- Area: Monarch Linn
--  Mob: Hotupuku
-- Bugard in the Clouds
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        between = 90,
        chance = 100,
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 75},
            {id = tpz.jsa.INVINCIBLE, hpp = 50},
            {id = tpz.jsa.MIGHTY_STRIKES, hpp = 25},
        },
    })

     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobEngaged(mob, target)
end


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local phalanxTime = mob:getLocalVar("Phalanx")
    local spikesTime = mob:getLocalVar("BlazeSpikes")

    if phalanxTime == 0 then
        mob:setLocalVar("Phalanx", math.random(2, 3)*15)
        return
    end
    if mob:getBattleTime() >= phalanxTime then
        mob:addStatusEffect(tpz.effect.PHALANX, 50, 0, 0)
        local buff1 = mob:getStatusEffect(buffone)
        mob:setLocalVar("Phalanx", mob:getBattleTime() + math.random(2, 3)*15)
        buff1:unsetFlag(tpz.effectFlag.DISPELABLE)
    end

    if spikesTime == 0 then
        mob:setLocalVar("Phalanx", math.random(2, 3)*30)
        return
    end
    if mob:getBattleTime() >= spikesTime then
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 25, 0, 0)
        local buff2 = mob:getStatusEffect(bufftwo)
        mob:setLocalVar("Blazespikes", mob:getBattleTime() + math.random(2, 3)*30)
        buff2:unsetFlag(tpz.effectFlag.DISPELABLE)
    end
end

function onMagicHit(caster, target, spell)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100, power = math.random(70, 90)})
end


