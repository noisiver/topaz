-----------------------------------
-- Area: Ordelles Caves
--   NM: Gerwitz's Sword
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
	mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCharVar("darkPuppetCS") >= 3 then
        player:setCharVar("darkPuppetCS", 4)
    end
end
