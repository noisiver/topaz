-----------------------------------

-- Area: Al'Taieu
--  Mob: Om'yovra
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(math.floor(mob:getMainLvl() * 2))
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addImmunity(tpz.immunity.PARALYZE)
    mob:hideName(true)
    mob:untargetable(true)
    mob:AnimationSub(5)
    mob:wait(2000)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {power = 25, chance = 25})
end

function onMobEngaged(mob, target)
    mob:hideName(false)
    mob:untargetable(false)
    mob:AnimationSub(6)
    mob:wait(2000)
end

function onMobFight(mob, target)
    if mob:hasStatusEffect(tpz.effect.BOOST) then
        mob:setDamage(280)
    else
        mob:setDamage(140)
    end
end

function onMobDisengage(mob)
    mob:hideName(true)
    mob:untargetable(true)
    mob:AnimationSub(5)
end

function onMobDeath(mob, player, isKiller)
end
