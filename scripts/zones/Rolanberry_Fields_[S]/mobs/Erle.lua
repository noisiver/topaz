------------------------------
-- Area: Rolanberry Fields [S]
--   NM: Erle
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMod(tpz.mod.MACC, 50) 
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMonsterMagicPrepare(mob, target)
        local rnd = math.random()
        if (rnd < 0.5) then
            return 185 -- aeroga II
        elseif (rnd < 0.7) then
            return 156 -- aero III
        elseif (rnd <= 1) then
            return 208 -- tornado
        end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 25, power = math.random(30, 50)})
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 512)
end
