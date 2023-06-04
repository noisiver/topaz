-----------------------------------
-- Area: Cloister of Gales
--  Mob: Garuda Prime
-- Involved in Quest: Trial by Wind, Trial Size Trial by Wind
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
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 35)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:addImmunity(tpz.immunity.SILENCE)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 875, hpp = math.random(30,55)}, -- uses Aerial Blast once while near 50% HPP.
        },
    })
end

function onMobFight(mob, target)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100, power = 25})
end

function onMobDeath(mob, player, isKiller)
end
