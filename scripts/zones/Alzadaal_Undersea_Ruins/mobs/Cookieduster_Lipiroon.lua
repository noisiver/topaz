-----------------------------------
-- Area: Alzadaal Undersea Ruins (72)
--   NM: Cookieduster Lipiroon
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(250)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.POISONRESTRAIT, 100)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1728 then -- Faze
		mob:useMobAbility(1730)  -- Deadeye
	end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {power = 70})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 477)
end
