-----------------------------------
-- Area: Silver Sea route to Al Zahbi
--  Mob: Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller)
end
