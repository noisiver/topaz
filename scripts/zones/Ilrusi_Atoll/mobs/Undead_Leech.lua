-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Undead Leech
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()

    instance:setProgress(instance:getProgress() + 1)
end
