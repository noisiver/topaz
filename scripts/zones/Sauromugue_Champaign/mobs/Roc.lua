-----------------------------------
-- Area: Sauromugue Champaign (120)
--  HNM: Roc
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {
            id = tpz.jsa.BENEDICTION,
            hpp = math.random(25,50),
            begCode = function(mob)
                mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
            end,
            endCode = function(mob)
                mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
            end,
        },
    },
})
     mob:addMod(tpz.mod.DEFP, 50) 
     mob:setMod(tpz.mod.ATT, 800)
     mob:setMod(tpz.mod.ACC, 1500) 
     mob:addMod(tpz.mod.EVA, 50)
     mob:setMod(tpz.mod.MACC, 1000) 
     mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ROC_STAR)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
