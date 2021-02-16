-----------------------------------
-- Area: Sauromugue Champaign (120)
--  HNM: Roc
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 50) 
     mob:addMod(tpz.mod.ATTP, 50)
     mob:addMod(tpz.mod.ACC, 1000) 
     mob:addMod(tpz.mod.EVA, 50)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ROC_STAR)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
