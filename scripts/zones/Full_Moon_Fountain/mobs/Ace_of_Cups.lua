-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Ace of Cups
-- Involved in Moon Reading (Windurst 9-2)
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
end

function allMoonMobsDead(player)
    local inst = player:getBattlefield():getArea()
    local instOffset = ID.mob.MOON_READING_OFFSET + (6 * (inst - 1))
    for i = instOffset, instOffset + 3 do
        if not GetMobByID(i):isDead() then
            return false
        end
    end
    return true
end

function onMobDeath(mob, player, isKiller, noKiller)
    if allMoonMobsDead(player) then
        player:release() -- prevents event collision if player kills multiple remaining mobs with an AOE move/spell
        player:startEvent(32004, 1, 0, 1, 0, 1)
    end
end
