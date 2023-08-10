-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Eo'Euvhi
-----------------------------------
mixins = {require("scripts/mixins/families/euvhi")}
-----------------------------------
function onMobSpawn(mob)
    mob:AnimationSub(4)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
