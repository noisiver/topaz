-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Morion Worm
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 1800)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.REGEN, 1, 3, 0)
end

function onMobDeath(mob, player, isKiller)
end
