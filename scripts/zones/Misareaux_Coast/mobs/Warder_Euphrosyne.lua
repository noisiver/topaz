-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder_Euphrosyne
-----------------------------------
require("scripts/zones/Misareaux_Coast/globals")
require("scripts/globals/missions");
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:SetMobAbilityEnabled(false)
    mob:setLocalVar("tp", math.random(1000, 3000))
end

function onMobFight(mob)
    if mob:getTP() >= mob:getLocalVar("tp") then
        MISAREAUX_COAST.prepareSpheroidTP(mob:getID())
    end
end

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.A_PLACE_TO_RETURN and player:getCharVar("PromathiaStatus") == 1) then
        player:setCharVar("Warder_Euphrosyne_KILL", 1)
    end
end
