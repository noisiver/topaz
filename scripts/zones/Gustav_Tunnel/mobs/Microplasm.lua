-----------------------------------
-- Area: Gustav Tunnel
--   NM: Microplasm
-- Note: Part of mission "The Salt of the Earth"
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (isKiller) then
        local mobId = mob:getID()
        local offset = mobId - ID.mob.GIGAPLASM
        local x = mob:getXPos()
        local y = mob:getYPos()
        local z = mob:getZPos()

        SpawnMob(mobId + offset + 1):setPos(x, y, z)
        SpawnMob(mobId + offset + 2):setPos(x-1, y, z-1)
        GetMobByID(mobId + offset + 1):updateEnmity(player)
        GetMobByID(mobId + offset + 2):updateEnmity(player)
    end
end
