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
end

 function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end
function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(50, 60)})
end


function onMobDeath(mob, player, isKiller)

    if (player:hasKeyItem(tpz.ki.YOMOTSU_HIRASAKA)) then
        player:addCharVar("OkuriNMKilled", 1)
    end

end
