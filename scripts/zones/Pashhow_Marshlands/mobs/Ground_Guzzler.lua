-----------------------------------
-- Area: Pashhow Marshlands
--  VNM: Ground Guzzler
-----------------------------------
require("scripts/globals/voidwalker")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobInitialize(mob)
    tpz.voidwalker.onMobInitialize(mob)
end

function onMobSpawn(mob)
    tpz.voidwalker.onMobSpawn(mob)
end

function onMobFight(mob, target)
    tpz.voidwalker.function onMobFight(mob, target)
end

function onMobDisengage(mob)
    tpz.voidwalker.onMobDisengage(mob)
end

function onMobDespawn(mob)
    tpz.voidwalker.onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.voidwalker.onMobDeath(mob, player, isKiller, tpz.keyItem.COLORFUL_ABYSSITE)
end