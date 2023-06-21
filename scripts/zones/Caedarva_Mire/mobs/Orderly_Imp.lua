-----------------------------------
-- Area: Caedarva Mire
--  Mob: Orderly Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, -75)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end


function onMobDeath(mob, player, isKiller)
end