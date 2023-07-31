-----------------------------------
-- Area: Sauromugue Champaign [S]
--   NM: Herensugue
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 90) -- "Triple Attacks almost every round"
    mob:addMod(tpz.mod.REGAIN, 150) -- "appears to have a high rate of Regain"
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.EVA, 25)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 531)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2  hours
end
