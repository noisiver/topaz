-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Replica
-----------------------------------
require("scripts/globals/dynamis")
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    dynamis.refillStatueOnSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    dynamis.refillStatueRestore(mob, player, isKiller)
end


function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.SMELTIX_THICKHIDE_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.JABKIX_PIGEONPECS_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.WASABIX_CALLUSDIGIT_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.TICKTOX_BEADYEYES_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.LURKLOX_DHALMELNECK_PH, 50, 3600) -- 20 minutes
    tpz.mob.phOnDespawn(mob, ID.mob.TRAILBLIX_GOATMUG_PH, 50, 3600) -- 20 minutes
end

function onMobDeath(mob, player, isKiller, noKiller)
    dynamis.refillStatueOnDeath(mob, player, isKiller)
end
