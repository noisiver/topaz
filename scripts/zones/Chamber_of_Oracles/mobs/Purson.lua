-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Purson
-- The Scarlet King
-- !additem 1178
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
mixins =
{
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ATTP, 25)
     mob:addMod(tpz.mod.ACC, 25) 
     mob:addMod(tpz.mod.EVA, 25)
     mob:addMod(tpz.mod.MDEF, 24) 
     mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
     tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 40, hpp = 98},
        },
     })
end

function onMobFight(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 802 then
        mob:resetEnmity(target)        
    end
end


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 25, power = math.random(100, 200)})
end

function onMobDeath(mob, player, isKiller)
end