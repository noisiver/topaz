-----------------------------------
-- Area: La Theine Plateau
--  VNM: Dawon
-----------------------------------
require("scripts/globals/voidwalker")
-----------------------------------

function onMobInitialize(mob)
    tpz.voidwalker.onMobInitialize(mob)
end

function onMobSpawn(mob)
    tpz.voidwalker.onMobSpawn(mob)
end

function onMobFight(mob, target)
    tpz.voidwalker.onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    if mob:hasStatusEffect(tpz.effect.PERFECT_DODGE) then
        return 273
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100, power = math.random(150, 250)})
end

function onMobDisengage(mob)
    tpz.voidwalker.onMobDisengage(mob)
end

function onMobDespawn(mob)
    tpz.voidwalker.onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.DAWON_TRAPPER)
    tpz.voidwalker.onMobDeath(mob, player, isKiller, tpz.keyItem.BLACK_ABYSSITE)
end