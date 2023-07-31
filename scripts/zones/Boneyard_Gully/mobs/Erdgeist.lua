------------------------------
-- Area: Boneyard Gully
--  Mob: Erdgeist
--  ENM: Totentanz
------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addImmunity(tpz.immunity.LIGHTSLEEP)
    mob:untargetable(false)
end

function onMobFight(mob, target)
    mob:untargetable(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
