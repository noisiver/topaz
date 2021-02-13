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
     mob:addMod(tpz.mod.DEFP, 20) 
     mob:addMod(tpz.mod.ATTP, 10)
     mob:addMod(tpz.mod.ACC, 30) 
     mob:addMod(tpz.mod.EVA, 30)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {chance = 100, power = math.random(30, 50)})
end

function onMobDeath(mob, player, isKiller)
    if (player:getCharVar("TheRequiemCS") == 3) then
        player:setCharVar("TheRequiemYumKilled", 1)
    end
end
