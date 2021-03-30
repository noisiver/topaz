-----------------------------------
-- Area: Toraimarai Canal
--   NM: Magic Sludge
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.HASTE_MAGIC, mob:getMod(tpz.mod.HASTE_MAGIC) + 5000)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.UFASTCAST, 150) 
end

function onMobDeath(mob, player, isKiller)
    player:setCharVar("rootProblem", 3)
end
