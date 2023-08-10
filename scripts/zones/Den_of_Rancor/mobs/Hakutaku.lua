-----------------------------------
-- Area: Den of Rancor
--   NM: Hakutaku
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
	mob:addMod(tpz.mod.ACC, 100) 
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:setMod(tpz.mod.SDT_WATER, 130)
    mob:setMod(tpz.mod.SDT_LIGHT, 70)
    mob:setMod(tpz.mod.SDT_EARTH, 70)
    mob:setMod(tpz.mod.SDT_WIND, 85)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:setMod(tpz.mod.SDT_FIRE, 5)
    mob:setMod(tpz.mod.SDT_ICE, 50)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 95)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
