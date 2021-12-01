-----------------------------------
-- Area: Riverne - Site A01
--  Mob: Carmine Dobsonfly
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMobMod(tpz.mobMod.SUPERLINK, ID.mob.CARMINE_DOBSONFLY_OFFSET)
    mob:SetMagicCastingEnabled(false) -- does not cast spells while idle
end

function onMobEngaged(mob, target)
    mob:SetMagicCastingEnabled(true)
end

function onMobDisengage(mob)
    mob:SetMagicCastingEnabled(false)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- each dead dobsonfly should stay despawned until all 10 are killed. then they respawn as a group.

    local allFliesDead = true
    for i = ID.mob.CARMINE_DOBSONFLY_OFFSET, ID.mob.CARMINE_DOBSONFLY_OFFSET + 9 do
        if (GetMobByID(i):isAlive()) then
            allFliesDead = false
        end
    end

    if (allFliesDead) then
        local respawnTime = math.random(36000, 43200) -- 11 to 12 hours
        for i = ID.mob.CARMINE_DOBSONFLY_OFFSET, ID.mob.CARMINE_DOBSONFLY_OFFSET + 9 do
            DisallowRespawn(i, false)
            GetMobByID(i):setRespawnTime(respawnTime)
        end
    else
        DisallowRespawn(mobID, true)
    end
end
