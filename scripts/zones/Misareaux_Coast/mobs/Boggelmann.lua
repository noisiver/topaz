-----------------------------------
-- Area: Misareaux Coast
--  Mob: Boggelmann
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end


function onMonsterAbilityPrepare(mob)
    if mob:getHPP() > 25 then
        return 0
    end

    return 1363
end


function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Boggelmann_KILL") == 0) then
        player:setCharVar("COP_Boggelmann_KILL", 1)
    end
end
