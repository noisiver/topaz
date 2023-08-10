-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Yali
-- Involved in Moon Reading (Windurst 9-2)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
end

function onMobSpawn(mob)
    local battlefield = mob:getBattlefield()
    local inst = battlefield:getArea()
    local instOffset = ID.mob.MOON_READING_OFFSET + (6 * (inst - 1))
    if
        GetMobByID(instOffset):isDead() and
        GetMobByID(instOffset+1):isDead() and
        GetMobByID(instOffset+2):isDead() and
        GetMobByID(instOffset+3):isDead()
    then
        battlefield:setLocalVar("phaseChange", 0)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
