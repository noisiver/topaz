-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Maat
-- Genkai 5 Fight
-----------------------------------
mixins = {require("scripts/mixins/families/maat")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
end

function onMobDeath(mob, player, isKiller)
end
