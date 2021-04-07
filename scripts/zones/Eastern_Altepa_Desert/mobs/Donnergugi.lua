------------------------------
-- Area: Eastern Altepa Desert
--   NM: Donnergugi
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:addMod(tpz.mod.SPELLINTERRUPT, 300)
    mob:addMod(tpz.mod.SLEEPRESTRAIT, 100)
    mob:addMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:addMod(tpz.mod.GRAVITYRESTRAIT, 100)
    mob:addMod(tpz.mod.BINDRESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 410)
end
