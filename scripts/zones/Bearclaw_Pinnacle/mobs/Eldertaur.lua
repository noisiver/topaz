-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Eldertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(65)
    mob:setMod(tpz.mod.ATT, 400)
    mob:setMod(tpz.mod.DEF, 350)
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.SDT_LIGHT, 50)
    mob:setMod(tpz.mod.SDT_DARK, 50)
    mob:addImmunity(tpz.immunity.SILENCE)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 25)
    mob:setMobMod(tpz.mobMod.HP_HEAL_CHANCE, 50)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
