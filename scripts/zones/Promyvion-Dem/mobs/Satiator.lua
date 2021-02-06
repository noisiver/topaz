-----------------------------------
-- Area: Promyvion Dem
--   NM: Satiator
-----------------------------------

function onMobSpawn(mob,target)
    mob:setMod(tpz.mod.ATT, 20)
    mob:setMod(tpz.mod.DEF, 20)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMod(tpz.mod.ACC, 30)
end

function onMobDeath(mob)
end