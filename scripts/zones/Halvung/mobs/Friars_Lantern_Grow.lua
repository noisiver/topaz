------------------------------
-- Area: Halvung
--   Mob: Friar's Latern
-- Grows in size like Big Bomb
-- Drops Big Bomb pop item Smoky Flask 
-- !additem 2384
------------------------------
mixins = {require("scripts/mixins/families/growing_bomb")}
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(100)
	mob:setMod(tpz.mod.MATT, 48)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
