-----------------------------------
-- Area: North Gustaberg
--  Mob: Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.STORETP, 100)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("thickAsThievesGamblingCS") == 5 then
        player:setCharVar("thickAsThievesGamblingCS", 6)
    end
end
