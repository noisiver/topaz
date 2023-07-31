-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Ash Dragon
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.ENHANCE, 396)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 15000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 15000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.DRAGON_ASHER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(39600) -- 11 hours
end
