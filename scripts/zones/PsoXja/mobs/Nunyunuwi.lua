-----------------------------------
-- Area: Pso'Xja
--  Mob: Nunyunuwi
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:addStatusEffect(tpz.effect.REGEN, 50, 3, 0)
end

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_ENDURING_TUMULT_OF_WAR and player:getCharVar("PromathiaStatus")==3) then
        player:setCharVar("PromathiaStatus", 4)
    end
end
