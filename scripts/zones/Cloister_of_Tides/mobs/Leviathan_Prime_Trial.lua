-----------------------------------
-- Area: Cloister of Tides
--  Mob: Leviathan Prime
-- Involved in Quest: Trial by Water, Trial Size Trial by Water
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
     mob:addMod(tpz.mod.MDEF, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 866, hpp = math.random(30,55)}, -- uses Tidal Wave once while near 50% HPP.
        },
    })
end

function onMobFight(mob, target)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, {chance = 100, power = 250})
end

function onMobDeath(mob, player, isKiller)
end
