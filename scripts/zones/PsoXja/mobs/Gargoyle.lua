-----------------------------------
-- Area: Pso'Xja
--  Mob: Gargoyle
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
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
