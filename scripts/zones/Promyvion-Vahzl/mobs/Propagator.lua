-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Propagator
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("maxBabies", 2)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
end


function onMobDeath(mob, player, isKiller)
    local momma = mob:getID()
    for i = momma + 1, momma + mob:getLocalVar("maxBabies") do
        local baby = GetMobByID(i)
        if baby:isSpawned() then
            baby:setHP(0)
        end
    end
    if player:getCurrentMission(COP) == tpz.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 1 then
        player:setCharVar("PromathiaStatus", 2)
    end
end
