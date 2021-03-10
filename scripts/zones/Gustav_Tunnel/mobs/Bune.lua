-----------------------------------
-- Area: Gustav Tunnel
--   NM: Bune
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.INVINCIBLE,
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
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.ACC, 100) 
    mob:addMod(tpz.mod.EVA, 100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 15000)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    -- Set Bune's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400))

end
