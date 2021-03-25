-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Tyrannic Tunnok
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 50) 
     mob:addMod(tpz.mod.ATTP, 50)
     mob:addMod(tpz.mod.ACC, 50) 
     mob:addMod(tpz.mod.EVA, 50)
     mob:setMod(tpz.mod.STORETP, 100)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 50 and hitTrigger == 0 then
        mob:setMod(tpz.mod.ATTP, 75)
        mob:setLocalVar("TriggerHit", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 1 then
        mob:setMod(tpz.mod.ATTP, 100)
        mob:setLocalVar("TriggerHit", 2)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {chance = 100, power = 50, duration = 20})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 400)
end
