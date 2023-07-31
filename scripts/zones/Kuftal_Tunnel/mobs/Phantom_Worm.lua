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
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 20)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REGEN, 50)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.UFASTCAST, 50) 
    mob:addMod(tpz.mod.SPELLINTERRUPT, 50)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 75)
	mob:addMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
