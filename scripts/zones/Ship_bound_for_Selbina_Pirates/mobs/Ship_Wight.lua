-----------------------------------
-- Area: Ship bound for Selbina (Pirates)
--  Mob: Ship Wight
-----------------------------------
function onMobSpawn(mob)
end

function onMobDeath(mob, player)

end

function onMobDespawn(mob, player)
    mob:setLocalVar("respawnTime", os.time() + 60)
end