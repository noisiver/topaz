------------------------------
-- Area: Halvung
--   NM: Flammeri
-- Lyft NM
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/wotg")
local ID = require("scripts/zones/Halvung/IDs")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(250) -- 350-450 on DD's
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 50) 
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
	mob:setMod(tpz.mod.STUNRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, {chance = 100, power = math.random(120, 150)})
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT1(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 467)
end
