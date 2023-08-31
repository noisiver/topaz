-----------------------------------
-- Area: Tahongi Canyon
--  VNM: Chesma
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

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, {chance = 100, power = math.random(25, 35)})
end

function onMobDisengage(mob)
    tpz.voidwalker.onMobDisengage(mob)
end

function onMobDespawn(mob)
    tpz.voidwalker.onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.voidwalker.onMobDeath(mob, player, isKiller, tpz.keyItem.GREY_ABYSSITE)
end