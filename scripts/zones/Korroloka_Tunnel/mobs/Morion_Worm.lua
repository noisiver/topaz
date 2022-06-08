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
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
    mob:addStatusEffect(tpz.effect.REGEN, 10, 3, 0)
    mob:addMod(tpz.mod.SPELLINTERRUPT, 50)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 75)
end

function onMobDeath(mob, player, isKiller)
end
