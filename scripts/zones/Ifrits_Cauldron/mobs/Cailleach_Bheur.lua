-----------------------------------
-- Area: Ifrit's Cauldron (205)
--  Mob: Cailleach Bheur
-- Note: Popped by qm3
-- Involved in Quest: Blood and Glory
-- !pos 117.074 19.403 144.834 205
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(140)
    mob:addMod(tpz.mod.DEFP, 200)
    mob:addMod(tpz.mod.MDEF, 100) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    tpz.wsquest.handleWsnmDeath(tpz.wsquest.retribution, player)
end
