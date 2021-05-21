------------------------------
-- Area: Outer Horutoto Ruins
--   Goblin Tomb Raider
--   !additem 479 
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("I..guess..you...deserve...it...m...m..more...",0,"Goblin")
end
