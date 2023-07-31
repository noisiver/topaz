-----------------------------------
-- Area: Lower Delkfutt's Tower
--   NM: Disaster Idol
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobEngaged(mob, target)
    local DayOfTheWeek = VanadielDayOfTheWeek()

    mob:setSpellList(118 + DayOfTheWeek)
    mob:setLocalVar("DayOfTheWeek", DayOfTheWeek + 1)
end

function onMobFight(mob, target)
    -- TODO: Has level mimic of person who spawned it. Minimum level 65. HP should scale accordingly.

    local DayOfTheWeek = VanadielDayOfTheWeek()
    local mobday = mob:getLocalVar("DayOfTheWeek")

    if DayOfTheWeek + 1 ~= mobday then
        mob:setSpellList(118 + DayOfTheWeek)
        mob:setLocalVar("DayOfTheWeek", DayOfTheWeek + 1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCurrentMission(COP) == tpz.mission.id.cop.THREE_PATHS and player:getCharVar("COP_Tenzen_s_Path") == 6 then
        player:setCharVar("COP_Tenzen_s_Path", 7)
    end
end
