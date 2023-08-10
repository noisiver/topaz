-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Gladiatorial Weapon
-- BCNM: Die by the Sword
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ATTP, 25)
	mob:addMod(tpz.mod.ACC, 25) 
	mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:addMod(tpz.mod.MDEF, 300)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobInitialize(mob)
end

function onMobWeaponSkill(target, mob, skill)
	local ChangeResistance = math.random(1, 3)
	mob:useMobAbility(624) -- 2 hour "cloud" animation
	if ChangeResistance == 1 then
		mob:AnimationSub(1) -- Slashing
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 1000)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.RANGEDRES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 0)
	elseif ChangeResistance == 2 then
		mob:AnimationSub(2) -- Piercing
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 1000)
        mob:setMod(tpz.mod.RANGEDRES, 1000)
        mob:setMod(tpz.mod.IMPACTRES, 0)
	elseif ChangeResistance == 2 then
		mob:AnimationSub(3) -- Blunt+Impact
        mob:setMod(tpz.mod.HTHRES, 1000)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.RANGEDRES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 1000)
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
