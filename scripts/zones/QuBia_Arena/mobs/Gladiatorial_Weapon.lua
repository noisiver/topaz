-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Gladiatorial Weapon
-- BCNM: Die by the Sword
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
	mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
	mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
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
