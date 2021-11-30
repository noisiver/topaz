-----------------------------------
-- Area: Riverne - Site A01
--   NM:Shieldtrap
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
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

    local DayOfTheWeek = VanadielDayOfTheWeek()
    local mobday = mob:getLocalVar("DayOfTheWeek")

    if DayOfTheWeek + 1 ~= mobday then
        mob:setSpellList(118 + DayOfTheWeek)
        mob:setLocalVar("DayOfTheWeek", DayOfTheWeek + 1)
    end
end