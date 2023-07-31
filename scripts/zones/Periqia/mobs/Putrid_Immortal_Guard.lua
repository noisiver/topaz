-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Putrid Immortal Guard
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end
