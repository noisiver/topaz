------------------------------
-- Area: Xarcabard [S]
--   NM: Prince Orobas
-- Lyft NM
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/status")
------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setDamage(250) 
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 25)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
	rnd = math.random()

    if (rnd < 0.5) then
        return math.random(273, 274) -- Sleepga / Sleepga 2
    elseif (rnd < 0.7) then
        return 245 -- Drain
    elseif (rnd < 0.9) then
        return 247 -- Aspir
    else
        return 252 -- Stun
    end
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, {chance = 100, power = math.random(60, 100)})
end


function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT1(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 541)
end
