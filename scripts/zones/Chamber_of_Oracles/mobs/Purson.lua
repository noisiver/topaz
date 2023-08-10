-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Purson
-- The Scarlet King
-- !additem 1178
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/magic")
mixins =
{
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
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

function onMobDeath(mob, player, isKiller, noKiller)
end