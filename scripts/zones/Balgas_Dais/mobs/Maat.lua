-----------------------------------
-- Area: Balga's Dais
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
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobDeath(mob, player, isKiller)
end
