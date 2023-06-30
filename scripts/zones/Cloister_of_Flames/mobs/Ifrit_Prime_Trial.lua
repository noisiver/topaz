-----------------------------------
-- Area: Cloister of Flames
--  Mob: Ifrit Prime
-- Involved in Quest: Trial by Fire, Trial Size Trial by Fire
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UFASTCAST, 25)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 50) 
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 848, hpp = math.random(30,55)}, -- uses Inferno once while near 50% HPP.
        },
    })
end



function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {chance = 100, power = 25})
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
end
