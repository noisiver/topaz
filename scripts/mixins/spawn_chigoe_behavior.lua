require("scripts/globals/mixins")
require("scripts/globals/status")


g_mixins = g_mixins or {}

g_mixins.spawn_chigoe_behavior = function(mob)

    mob:addListener("SPAWN", "SLEEP_SPAWN", function(mob)
        mob:setLocalVar("ChigoeSpawnPool", 1)
        mob:setLocalVar("ChigoeSpawnCount", 1)
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "SPAWN_CHIGOE_WEAPONSKILL_STATE_EXIT", function(mob, skillid)
        mob:timer(2000, function(mob)
            local spawned = mob:getLocalVar("ChigoesSpawned")
            local spawnCount = mob:getLocalVar("ChigoeSpawnCount")
            local count = 0
            local target = mob:getTarget()
            if target and target:isPet() then
                target = target:getMaster()
            end
            if spawned < 5 then
                local ID = zones[mob:getZoneID()]
                for i, id in ipairs(ID.mob.SPAWN_CHIGOE_POOLS[mob:getLocalVar("ChigoeSpawnPool")]) do
                    if GetMobAction(id) == 0 then
                        chigoe = GetMobByID(id)
                        chigoe:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
                        SpawnMob(id)
                        if target then
                            chigoe:updateEnmity(target)
                        end
                        spawned = spawned + 1
                        mob:setLocalVar("ChigoesSpawned", spawned)
                        chigoe:addListener("DISENGAGE", "CHIGOE_DISENGAGE", function(mob)
                            mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
                            DespawnMob(mob:getID(), 15)
                        end)
                        count = count + 1
                        if count >= spawnCount or spawned >= 5 then
                            break
                        end
                    end
                end
            end
        end)
    end)

end

return g_mixins.spawn_chigoe_behavior