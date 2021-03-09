-----------------------------------
-- Area: Den of Rancor
--   NM: Hakutaku
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 100) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
    mob:setMod(tpz.mod.SDT_WATER, 150)
    mob:setMod(tpz.mod.SDT_LIGHT, 150)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_WIND, 100)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:setMod(tpz.mod.SDT_FIRE, 5)
    mob:setMod(tpz.mod.SDT_ICE, 5)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobDeath(mob, player, isKiller)
end
