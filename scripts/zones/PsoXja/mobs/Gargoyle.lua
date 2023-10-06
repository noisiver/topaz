-----------------------------------
-- Area: Pso'Xja
--  Mob: Gargoyle
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (isKiller) then
        local mobId = mob:getID()
        local offset = mobId - ID.mob.GARGOYLE_OFFSET
        if (offset < 16) then
            GetNPCByID(ID.npc.STONE_DOOR_OFFSET + offset):openDoor(30)
        end
    end
end

function onMobDespawn(mob)
end
