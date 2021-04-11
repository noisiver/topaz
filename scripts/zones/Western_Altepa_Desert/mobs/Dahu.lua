------------------------------
-- Area: Western Altepa Desert
--   NM: Dahu
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 75) 
     mob:addMod(tpz.mod.ATTP, 50)
     mob:addMod(tpz.mod.ACC, 25) 
     mob:addMod(tpz.mod.EVA, 25)
     mob:addMod(tpz.mod.MDEF, 100) 
     mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
     mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
     mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
     mob:addMod(tpz.mod.BINDRESTRAIT, 100)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 500)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE, {chance = 100, power = math.random(30, 50)})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 413)
end
