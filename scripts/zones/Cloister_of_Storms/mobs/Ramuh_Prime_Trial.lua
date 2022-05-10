-----------------------------------
-- Area: Cloister of Storms
--  Mob: Ramuh Prime
-- Involved in Quest: Trial by Lightning, Trial Size Trial by Lightning
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(120)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 314) 
    mob:setMod(tpz.mod.UFASTCAST, 25)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 50) 
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 35)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 893, hpp = math.random(30,55)}, -- uses Judgment Bolt once while near 50% HPP.
        },
    })
end


function onMobFight(mob, target)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, {chance = 100, power = 250})
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 252 then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(10)
	end
end

function onMobDeath(mob, player, isKiller)
end
