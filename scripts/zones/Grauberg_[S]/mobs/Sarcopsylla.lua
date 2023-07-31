-----------------------------------
-- Area: Grauberg [S]
--   NM: Sarcopsylla
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/families/chigoe")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.MACC, 50) 
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMonsterMagicPrepare(mob, target)
        local rnd = math.random()
        if (rnd < 0.5) then
            return 176 -- Firaga III
        elseif (rnd < 0.7) then
            return 146 -- Fire III
        elseif (rnd < 0.9) then
            return 204 -- Flare
		else
			return 235 -- Burn
        end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 502)
end
