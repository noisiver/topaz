-----------------------------------
-- Area: Den of Rancor
--   NM: Mokumokuren
-- Note: Popped by qm2
-- !pos 117 36 -280 160
-- Involved in Quest: Souls in Shadow
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.spiral_hell, player)
end
