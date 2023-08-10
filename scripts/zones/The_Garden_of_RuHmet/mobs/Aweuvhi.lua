-----------------------------------
-- Area: The Garden of Ru'Hmet
--  NPC: Aw'Euvhi
-----------------------------------
mixins = {require("scripts/mixins/families/euvhi")}
-----------------------------------
function onMobSpawn(mob)
    local animations = {4, 6}
    mob:AnimationSub(animations[math.random(#animations)])
end

function onMobDeath(mob, player, isKiller, noKiller)
end
