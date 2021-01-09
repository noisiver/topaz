-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Yum Kimil
-- Involved in Quest: The Requiem (BARD AF2)
-- !pos -414 8 499 195
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
     mob:setMod(tpz.mod.SLEEPRES, 100) 
    mob:setMod(tpz.mod.LULLABYRES, 100)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {chance = 20, power = math.random(30, 50)})
end

function onMobDeath(mob, player, isKiller)
    if (player:getCharVar("TheRequiemCS") == 3) then
        player:setCharVar("TheRequiemYumKilled", 1)
    end
end
