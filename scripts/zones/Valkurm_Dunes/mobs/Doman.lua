-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Doman
-- Involved in Quest: Yomi Okuri
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.SLEEPRES, 100) 
    mob:setMod(tpz.mod.LULLABYRES, 100)
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDRAIN)
end

function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(tpz.ki.YOMOTSU_HIRASAKA)) then
        player:addCharVar("OkuriNMKilled", 1)
    end

end
