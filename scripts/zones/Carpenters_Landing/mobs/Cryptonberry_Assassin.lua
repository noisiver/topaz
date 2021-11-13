-----------------------------------
-- Area: Carpenters' Landing
--   NM: Cryptonberry Assassin
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
local ID = require("scripts/zones/Carpenters_Landing/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180) -- 3 minutes
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    local sp = {}
    sp[tpz.job.BLM] = tpz.jsa.MANAFONT
    sp[tpz.job.SMN] = tpz.jsa.ASTRAL_FLOW
    sp[tpz.job.THF] = tpz.jsa.PERFECT_DODGE

    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = sp[mob:getMainJob()],
                begCode = function(mob)
                    mob:messageText(mob, ID.text.CRYPTONBERRY_ASSASSIN_2HR)
                end,
            },
        },
    })
    mob:setLocalVar("despawnTime", os.time() + 180)
    local main = GetMobByID(ID.mob.CRYPTONBERRY_EXECUTOR)
    local targ = main:getTarget()
    if targ then
        mob:updateClaim(targ)
    end
end

function onMobEngaged(mob, target)
    mob:setLocalVar("despawnTime", 0)
end

function onMobRoam(mob)
    -- if not claimed within 3 minutes of spawning, despawn
    local despawnTime = mob:getLocalVar("despawnTime")
    if despawnTime > 0 and os.time() > despawnTime then
        DespawnMob(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == tpz.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("Cryptonberry_Executor_KILL") < 2 then
        local offset = mob:getID() - ID.mob.CRYPTONBERRY_EXECUTOR
        player:setCharVar(string.format("Cryptonberry_Assassins-%i_KILL", offset), 1)
    end
end
