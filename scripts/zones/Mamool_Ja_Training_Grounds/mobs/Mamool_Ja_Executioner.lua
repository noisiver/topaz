-----------------------------------
-- Area: Mamool Ja Training Grounds (Preemptive Strike)
--  Mob: Mamool Ja Executioner
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end
