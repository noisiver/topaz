-----------------------------------
-- Area: Sacrarium
--  Mob: Mariselle's Pupil
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
