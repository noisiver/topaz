-----------------------------------
-- Area: East Ronfaure_[S]
--  VNM: Capricornus
-----------------------------------
require("scripts/globals/voidwalker")
-----------------------------------

function onMobInitialize(mob)
    tpz.voidwalker.onMobInitialize(mob)
end

function onMobSpawn(mob)
    tpz.voidwalker.onMobSpawn(mob)
end

onMobFight(mob, target)
    tpz.voidwalker.onMobFight(mob, target)
end

function onMobDisengage(mob)
    tpz.voidwalker.onMobDisengage(mob)
end

function onMobDespawn(mob)
    tpz.voidwalker.onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.KRABKATOA_STEAMER)
    tpz.voidwalker.onMobDeath(mob, player, isKiller, xi.keyItem.BLACK_ABYSSITE)
end
