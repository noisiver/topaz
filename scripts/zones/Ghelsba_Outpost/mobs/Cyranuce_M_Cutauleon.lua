-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Cyranuce M Cutauleon
-- Involved in Quest: The Holy Crest
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(45)
	mob:setMod(tpz.mod.ATTP, 15)
	mob:setMod(tpz.mod.DEFP, 15)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller)
end
