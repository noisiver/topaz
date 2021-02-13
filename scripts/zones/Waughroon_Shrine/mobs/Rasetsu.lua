-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Rasetsu
-- a Thief in Norg BCNM Fight
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
end
