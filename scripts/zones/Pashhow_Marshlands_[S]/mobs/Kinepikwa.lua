-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Kinepikwa
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.REGEN, 50)
	mob:setMod(tpz.mod.MOVE, 12)
end

function onMonsterMagicPrepare(mob, target)
    return 231 -- Bio II
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 507)
end
