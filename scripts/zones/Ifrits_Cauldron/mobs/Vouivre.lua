------------------------------
-- Area: Ifrits Cauldron
--   NM: Vouivre
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------

function onMobSpawn(mob)
    mob:setDamage(125)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 50) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.REGEN, 75)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
    mob:addImmunity(tpz.immunity.SLEEP)
end

function onMobFight(mob, target)
    -- Cannot be pulled out of his spawn area. He will despawn.
    if mob:checkDistance(mob:getSpawnPos()) > 30 then
        DespawnMob(mob:getID())
        mob:setRespawnTime(30)
    else
        DisallowRespawn(mob:getID(), true)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 402)
end
