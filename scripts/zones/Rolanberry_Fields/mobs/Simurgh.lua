-----------------------------------
-- Area: Rolanberry Fields (110)
--  HNM: Simurgh
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:setMod(tpz.mod.ATT, 800)
    mob:setMod(tpz.mod.ACC, 430) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMod(tpz.mod.MACC, 1000) 
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.MIGHTY_STRIKES,
                hpp = math.random(25, 50),
                begCode = function(mob)
                  
                 -- mob:messageText(mob, ID.text.HOW_CAN_YOU_EXPECT_TO_KILL_ME)
                 -- mob:PrintToArea("My power is too great for you!",0,"Murgleis")
                end,
                endCode = function(mob)
               --mob:messageText(mob, ID.text.WHEN_YOU_CANT_EVEN_HIT_ME)
                end,
            },
        },
    })
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SIMURGH_POACHER)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 82800)) -- 21 to 23 hours
end
