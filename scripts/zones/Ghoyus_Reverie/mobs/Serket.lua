-----------------------------------
-- Area: Ghoyu's Reverie
--  Mob: Serket
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
    mob:setMod(tpz.mod.DEF, 450)
    mob:setMod(tpz.mod.EVA, 340)
    mob:addMod(tpz.mod.MDEF, 40)
	mob:setMod(tpz.mod.VIT, 50)
    mob:addMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
end

function onMobRoam(mob)
end

function onMobFight(mob, target)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PSNSTACK, {chance = 100, power = 30})
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end