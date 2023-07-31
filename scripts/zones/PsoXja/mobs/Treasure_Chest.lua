-----------------------------------
-- Area: Pso'xja
--   Mob: Treasure Chest
-- It's a Mimic!
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
-----------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 3)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobFight(mob, target)
end

function onMobRoam(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    --mob:setPos(-299.5302,-15.5611,140.4806,90)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
