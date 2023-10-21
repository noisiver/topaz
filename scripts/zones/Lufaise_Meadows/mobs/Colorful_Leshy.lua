-----------------------------------
-- Area: Lufaise Meadows
--  Mob: Colorful Leshy
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobInitialize(mob)
end

function disturbMob(mob)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
