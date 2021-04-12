------------------------------
-- Area: Western Altepa Desert
--   NM: Picolaton
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 75) 
     mob:addMod(tpz.mod.ATTP, 150)
     mob:addMod(tpz.mod.ACC, 100) 
     mob:addMod(tpz.mod.EVA, 50)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
     mob:addMod(tpz.mod.BINDRESTRAIT, 100)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100, power = math.random(20, 50)})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 414)
end
