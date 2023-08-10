-----------------------------------
-- Area: Al'Taieu
--  Mob: Ul'hpemde
-----------------------------------
mixins = {require("scripts/mixins/families/hpemde")}
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("[hpemde]dive", 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
