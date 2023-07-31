-----------------------------------
-- Area: Ordelles Caves
--   NM: Gerwitz's Axe
-- Involved In Quest: Dark Puppet
-- !pos -51 0.1 3 193
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, 50) 
	mob:addMod(tpz.mod.ACC, 1000) 
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 25, power = math.random(100, 150)})
end


function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCharVar("darkPuppetCS") >= 2 then
        player:setCharVar("darkPuppetCS", 3)
    end
end
