------------------------------
-- Area: Outer Horutoto Ruins
--   Goblin Grenade
--   Self-destructs immediately
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
     mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
     mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
	 mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	 mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
	mob:useMobAbility(509) -- Self-destruct_Goblin_Grenade
end

function onMobDeath(mob, player, isKiller)
end
