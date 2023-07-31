------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Hemodrosophila
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMonsterMagicPrepare(mob, target)
        local rnd = math.random()
        if (rnd < 0.5) then
            return 273 -- Sleepga
        elseif (rnd < 0.7) then
            return 232 -- Bio III
        elseif (rnd <= 1) then
            return 245 -- Drain
        end
	return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 25, duration = 5})
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 527)
end
