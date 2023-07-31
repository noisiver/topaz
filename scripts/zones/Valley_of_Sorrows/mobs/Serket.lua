-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Serket
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(175)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 450)
    mob:setMod(tpz.mod.EVA, 340)
    mob:addMod(tpz.mod.MDEF, 40)
	mob:setMod(tpz.mod.VIT, 50)
    mob:setMod(tpz.mod.SLASHRES, 850)
    mob:setMod(tpz.mod.PIERCERES, 850)
    mob:setMod(tpz.mod.RANGEDRES, 850)
    mob:addMod(tpz.mod.UDMGMAGIC, -13)
    mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
end

function onMobRoam(mob)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    return 353
end


function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, {chance = 20, power = 100})
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
end