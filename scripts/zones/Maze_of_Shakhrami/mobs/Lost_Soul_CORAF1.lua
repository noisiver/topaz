-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Lost Soul
-- COR AF1 Fight Equipped for All Occasions
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCharVar("EquippedforAllOccasions") == 1 then
        player:setCharVar("EquippedforAllOccasions", 2)
    end
end
