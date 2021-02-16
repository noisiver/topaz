-----------------------------------
-- Area: Crawlers' Nest (197)
--  Mob: Demonic Tiphia
-----------------------------------
require("scripts/globals/hunts")

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 236)
end
