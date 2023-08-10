-----------------------------------
-- Area: Beaucedine Glacier [S]
--  Mob: Glacial Imp
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
